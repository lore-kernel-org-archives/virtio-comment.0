Return-Path: virtio-comment-return-603-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F39E985BE2
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Feb 2019 07:02:34 +0000 (UTC)
Date: Mon, 11 Feb 2019 02:02:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190211015836-mutt-send-email-mst@kernel.org>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFB@hasmsx109.ger.corp.intel.com>
 <20190211014709-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190211014709-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] VirtIO spec issue - Available Buffer
 Notification Suppression
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Elmaleh, Liron" <liron.elmaleh@intel.com>, cunming.liang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Feb 11, 2019 at 01:58:09AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 31, 2019 at 01:16:29PM +0000, Savir, Gil wrote:
> > Hi,
> > 
> >  
> > 
> > If VIRTIO_F_EVENT_IDX feature bit is negotiated, then Available Buffer
> > Notification Suppression mechanism used is avail event (not flags).
> > 
> > The spec (both v1.0 / v1.1-draft) states that the device MAY use this mechanism
> > (Paragraph 2.4.9.2 / 2.6.10.2 respectively).
> > 
> > This statement implies that the device may choose not to use this suppression
> > mechanism (even if VIRTIO_F_EVENT_IDX was negotiated).
> > 
> >  
> > 
> > However – there’s no way for the device to inform the driver that he is not
> > using avail_event.
> > 
> > As consequence, since there will be a default value in avail_event (probably
> > 0x0), then the driver will always assume that it has to send notify “once-per
> > ring”.
> 
> 
> No I think this part is wrong, pls see below.
> 
> 
> > This will render performance futile, or force the device to actively update
> > avail_event.
> > 
> >  
> > 
> > Is there a way for the device to inform the driver that he is not using
> > avail_event (and I missed it)?
> > 
> >  
> > 
> > If yes, than my apologies for wasting your time.
> > 
> > If no, then I suggest one of the following:
> > 
> > ·         Either, to change the “MAY” (referred above) to “MUST”,
> > 
> 
> Thanks for the feedback!
> 
> So we are talking about split queues.
> 
> If avail_event is never set and remains 0, driver will send
> notifications every time index wraps around to 0, which
> would be every 2^16.
> 
> This is I think expected since the spec says:
> 
> The device MUST handle spurious notifications from the driver.
> 
> 2^16 does not seem excessive so I don't think it will render performance
> futile.


To add to that, above is based on

2.6.10.1
Driver Requirements: Available Buffer Notification Suppression

which states:

After the driver writes a descriptor index into the available ring:
– If the idx field in the available ring (which determined where that descriptor index was placed)
was equal to avail_event, the driver MUST send a notification.
– Otherwise the driver SHOULD NOT send a notification.



Pls let the TC know whether taking the above into account you think
further clarification in the spec is necessary.

Thanks!


> > ·        Or, to add way for the device to inform the driver that he is not
> > using avail_event (flag /certain reserved value in avail_event /other
> > mechanism).
> > 
> >  
> > 
> > Thanks,
> > 
> > Gil Savir
> > 
> > Intel Corporation
> 
> It might be a good addition to spec, probably along the lines
> of an option to send notifications on
> even suppression changes (which was proposed in the past, but
> was not included due to lack of time).
> 
> -- 
> MST

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

