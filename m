Return-Path: <virtio-comment-return-6192-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E18C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:18:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F30123D5A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:18:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EEDFA98658C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:18:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E431098657E; Tue,  6 Jun 2023 23:18:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFDBD986674
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 23:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZGknO7HRNt6XZ2m4zsPL2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686093490; x=1688685490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wOi07aOLsFMozEaoN0+GQP3MNh8VzImYS85Gyf+Dw4=;
        b=JaTakKxhuqxFX59mlWFiBDaifCtMOU1Bj9UM1viPeB33d98ifjkAV/EwRZ0XlUn+zO
         L5NmlODBR6IflLUO5Bd+MjP4Y82pdssd02tuwuLQIudQNy1o4rPghG8RvmfRWhHsW132
         no7WJXE5MqB2inAzOiRKNGeEW4qN+A/fSBv5nZsfPxAnY9dUQI1I4XSshUSbBVPRfQjn
         pgMMgzgrobakRqV/utqzgRDcrS9mEz9CtpV5AEwhUdWB6pPRr7suVFmw65Kmb73wuIVd
         S3RDlgfF/6ASzIsntZmjREeTSqNUbiQZlVDEXIQz9a4NEgaNpvD+//BnY4ysNEX+7mLP
         Dz8Q==
X-Gm-Message-State: AC+VfDyMhGoyi+xFKUbItvYC6HUdGV5BDY3u2HYF1IqxWiqE7HtSO+14
	ESctZJkNi3/yimYhFTrFoMmLSme3q5ftJmMzayFrIj+cGhWDF67Pg18k8XdnrDEZTXSP79tU24T
	uI9/yOx9MAP83J2uwcZ+EZC5pUxzhM6rERw==
X-Received: by 2002:a1c:7203:0:b0:3f7:371a:ec8f with SMTP id n3-20020a1c7203000000b003f7371aec8fmr2971608wmc.15.1686093490476;
        Tue, 06 Jun 2023 16:18:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ43NfnrQCdZwjVCJT+FeHVVjX6exvFI5u4yujNiNp4fA6hkElQFzTg7NhnIsOxNM3Igq+VQiA==
X-Received: by 2002:a1c:7203:0:b0:3f7:371a:ec8f with SMTP id n3-20020a1c7203000000b003f7371aec8fmr2971600wmc.15.1686093490158;
        Tue, 06 Jun 2023 16:18:10 -0700 (PDT)
Date: Tue, 6 Jun 2023 19:18:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606191055-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Tuesday, June 6, 2023 6:57 PM
> 
> > > It matters for requirements, so we produce design that addresses it.
> > > We don't want to add config space every growing bit map which may be
> > different between different devices.
> > 
> > then say that you want to conserve config space, that is the requirement. not
> > cvq specifically.
> >
> Well in one meeting you specifically told that requirements and design to be combined together, so it is drafted this way.
> Instead of very abstract like "conserve config space".
> 
> We can debate and change from cvq to new cfgvq as part of the journey.
> It is fine.

just don't keep listing this in each feature. my plan is to work
on cfgvq so we can keep using config space without these
limitations.

> > > >
> > > > what matters is whether they have to be synchronized with a given
> > > > queue - I get it they don't have to.
> > > They don't have to be.
> > 
> > Then say that.
> >
> I thought this is very obvious as querying counter is hundred-time slower operation than packet processing.
>  
> > > I don't see how it can be every synchronized.
> > 
> > you could program them through the vq itself.
> > 
> Do you mean in the packet transmit and receive completions itself?
> It would be too heavy to do so to mix the control fields in the data path.

maybe. but notice how you have a specific design in mind so you are jumping ahead.
you asked how we could make these synch, i told you how.
the actual point is you want to say "we don't need this synchronous",
design idea: use cvq


> > > > we don't cover migration currently don't see how this is a spec rquirement.
> > > > unless maybe it's justification for 4?
> > > True, but design need to keep this in mind if it has some touch points like of
> > #4 so when migration arrives, it has the building block in place.
> > 
> > so again, let's make sure we capture the actual spec requirement.
> >
> It is an actual spec requirement to be done and drafted in the spec.
> We may not do everything in the first phase, this are the broad requirements.
> And in design, we will say, requirement #4 is phase 2.

yes but this one I don't know what it means, spec wise.
some kind of block? what for?

> > 
> > > > so maybe it means there needs to be a way to set counters?
> > > > so there's no need to mention migration - just that it should be
> > > > possible to move counters between devices.
> > > >
> > > > > +4. If a virtio device is group member device, a group owner should be
> > able
> > > > > +   to query all the counter attributes using the admin queue command
> > which
> > > > > +   a virtio device will expose via a control vq to the driver.
> > > >
> > > >
> > > > this seems weirdly specific.
> > > > what is the actual requirement?
> > > >
> > > I don't follow the question.
> > > When a device migrates from src to dst, group owner needs to know if both
> > side underlying member device has same counter attributes or not.
> > 
> > whether it's through a command or not is not a requirement and I still do not
> > know what the requirement is.
> > what does "same counter attributes" mean? you never mentioned attributes
> > before.
> >
> I will refine this further and drop the word "attribute".
> If device support X counters, group owner should be able to know this bitmap.

i guess device might only support part of counters then?

> > > Yes, will change the GUEST surfaced from the current F_GUEST terminology of
> > the net device.
> > 
> > So?  this predates 1.x spec we never bothered changing them.
> >
> Will remove the guest wording and will change to transmit and receive.
> 
>  
> > > > > +4. le64 rx_pkts: Total packets received by the device
> > > >
> > > > including dropped ones or not?
> > > >
> > > Not including. Will add this clarification further in v1.
> > >
> > > > > +
> > > > > +### 3.1.2 Per transmit queue counters 1. le64 tx_bad_desc_errors:
> > > > > +Descriptors dropped by the device due to errors in
> > > > > +   descriptors
> > > >
> > > > since when do we drop packets on error in descriptor?
> > > > we just as likely stall ...
> > > >
> > > It is left to the device to implement on what to do on bad desc.
> > 
> > then how can you count drops? 
> A device may count the drops based on errors.
> It is counting drops based on the error it got.
> 
> > why does this even matter?
> To debug.

for debugging it's easiest if you just stop the vq, instead of drops.

> > and why on tx specifically?
> Missed the rx, will add.
> 
> > I feel addressing descriptor errors is a completely separate project.
> 
> Not sure if it is that big project.

I would have a separate debug section.

-- 
MST


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

