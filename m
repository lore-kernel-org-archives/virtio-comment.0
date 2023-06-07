Return-Path: <virtio-comment-return-6212-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B1C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:05:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8F91D157EE5
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BBA6986663
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:05:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7210F98664C; Wed,  7 Jun 2023 09:05:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 937A498664F;
	Wed,  7 Jun 2023 09:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vka496w_1686128631;
Message-ID: <1686128584.2573118-1-xuanzhuo@linux.alibaba.com>
Date: Wed, 7 Jun 2023 17:03:04 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Parav Pandit <parav@nvidia.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606191055-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606191055-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add requirements document for release 1.4

On Tue, 6 Jun 2023 19:18:06 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> >
> >
> > > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > > open.org> On Behalf Of Michael S. Tsirkin
> > > Sent: Tuesday, June 6, 2023 6:57 PM
> >
> > > > It matters for requirements, so we produce design that addresses it.
> > > > We don't want to add config space every growing bit map which may be
> > > different between different devices.
> > >
> > > then say that you want to conserve config space, that is the requirement. not
> > > cvq specifically.
> > >
> > Well in one meeting you specifically told that requirements and design to be combined together, so it is drafted this way.
> > Instead of very abstract like "conserve config space".
> >
> > We can debate and change from cvq to new cfgvq as part of the journey.
> > It is fine.
>
> just don't keep listing this in each feature. my plan is to work
> on cfgvq so we can keep using config space without these
> limitations.


cfgvq?

Did I miss someting?


Thanks.

>
> > > > >
> > > > > what matters is whether they have to be synchronized with a given
> > > > > queue - I get it they don't have to.
> > > > They don't have to be.
> > >
> > > Then say that.
> > >
> > I thought this is very obvious as querying counter is hundred-time slower operation than packet processing.
> >
> > > > I don't see how it can be every synchronized.
> > >
> > > you could program them through the vq itself.
> > >
> > Do you mean in the packet transmit and receive completions itself?
> > It would be too heavy to do so to mix the control fields in the data path.
>
> maybe. but notice how you have a specific design in mind so you are jumping ahead.
> you asked how we could make these synch, i told you how.
> the actual point is you want to say "we don't need this synchronous",
> design idea: use cvq
>
>
> > > > > we don't cover migration currently don't see how this is a spec rquirement.
> > > > > unless maybe it's justification for 4?
> > > > True, but design need to keep this in mind if it has some touch points like of
> > > #4 so when migration arrives, it has the building block in place.
> > >
> > > so again, let's make sure we capture the actual spec requirement.
> > >
> > It is an actual spec requirement to be done and drafted in the spec.
> > We may not do everything in the first phase, this are the broad requirements.
> > And in design, we will say, requirement #4 is phase 2.
>
> yes but this one I don't know what it means, spec wise.
> some kind of block? what for?
>
> > >
> > > > > so maybe it means there needs to be a way to set counters?
> > > > > so there's no need to mention migration - just that it should be
> > > > > possible to move counters between devices.
> > > > >
> > > > > > +4. If a virtio device is group member device, a group owner should be
> > > able
> > > > > > +   to query all the counter attributes using the admin queue command
> > > which
> > > > > > +   a virtio device will expose via a control vq to the driver.
> > > > >
> > > > >
> > > > > this seems weirdly specific.
> > > > > what is the actual requirement?
> > > > >
> > > > I don't follow the question.
> > > > When a device migrates from src to dst, group owner needs to know if both
> > > side underlying member device has same counter attributes or not.
> > >
> > > whether it's through a command or not is not a requirement and I still do not
> > > know what the requirement is.
> > > what does "same counter attributes" mean? you never mentioned attributes
> > > before.
> > >
> > I will refine this further and drop the word "attribute".
> > If device support X counters, group owner should be able to know this bitmap.
>
> i guess device might only support part of counters then?
>
> > > > Yes, will change the GUEST surfaced from the current F_GUEST terminology of
> > > the net device.
> > >
> > > So?  this predates 1.x spec we never bothered changing them.
> > >
> > Will remove the guest wording and will change to transmit and receive.
> >
> >
> > > > > > +4. le64 rx_pkts: Total packets received by the device
> > > > >
> > > > > including dropped ones or not?
> > > > >
> > > > Not including. Will add this clarification further in v1.
> > > >
> > > > > > +
> > > > > > +### 3.1.2 Per transmit queue counters 1. le64 tx_bad_desc_errors:
> > > > > > +Descriptors dropped by the device due to errors in
> > > > > > +   descriptors
> > > > >
> > > > > since when do we drop packets on error in descriptor?
> > > > > we just as likely stall ...
> > > > >
> > > > It is left to the device to implement on what to do on bad desc.
> > >
> > > then how can you count drops?
> > A device may count the drops based on errors.
> > It is counting drops based on the error it got.
> >
> > > why does this even matter?
> > To debug.
>
> for debugging it's easiest if you just stop the vq, instead of drops.
>
> > > and why on tx specifically?
> > Missed the rx, will add.
> >
> > > I feel addressing descriptor errors is a completely separate project.
> >
> > Not sure if it is that big project.
>
> I would have a separate debug section.
>
> --
> MST
>
>
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
>

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

