/*
 Copyright (c) 2011, OpenEmu Team
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
     * Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
     * Neither the name of the OpenEmu Team nor the
       names of its contributors may be used to endorse or promote products
       derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY OpenEmu Team ''AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL OpenEmu Team BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "OESetupAssistantBackgroundView.h"
#import "OESetupAssistantQCOpenGLLayer.h"

@interface OESetupAssistantBackgroundView ()
- (void)OE_commonSetupAssistantBackgroundViewInit;
@property(retain) OESetupAssistantQCOpenGLLayer *layer;
@end

@implementation OESetupAssistantBackgroundView
@dynamic layer;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if((self = [super initWithCoder:aDecoder]))
    {
        [self OE_commonSetupAssistantBackgroundViewInit];
    }
    return self;
}

- (id)initWithFrame:(NSRect)frameRect
{
    if((self = [super initWithFrame:frameRect]))
    {
        [self OE_commonSetupAssistantBackgroundViewInit];
    }
    
    return self;
}

- (void)OE_commonSetupAssistantBackgroundViewInit
{
    OESetupAssistantQCOpenGLLayer *backgroundAnimation = [OESetupAssistantQCOpenGLLayer layer];
    
    [backgroundAnimation setFrame:[self bounds]];
    [backgroundAnimation setAutoresizingMask:kCALayerWidthSizable | kCALayerHeightSizable];
    [backgroundAnimation setAsynchronous:YES];
    
    [self setLayer:backgroundAnimation];
    
    [self setWantsLayer:YES];
}

- (void)viewDidMoveToWindow
{
    [super viewDidMoveToWindow];
    
    [[self layer] setContainingWindow:[self window]];
}

@end
