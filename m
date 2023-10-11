Return-Path: <virtio-comment-return-7670-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD98CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 20:14:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E26D91318CE
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 20:14:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC5DC986837
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 20:14:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A3528985E63; Wed, 11 Oct 2023 20:14:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F42398660E
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 20:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: npe-jdymPvOz9FV-yGZ0DA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697055245; x=1697660045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKZ0z56PQ6GcBdih6CGIdBKVvJx64VmwMw5uEUxDCe8=;
        b=j4SbHfiPuh+bB3t6+c2kUWQjGMu+MxOVyEmUJFvxjs0TF3TtLuKALPIHprhOePwSXS
         ENdiWlz16s3MQk4/XTs+Qx0S0w861ORSBwOjktxtTjxFv+yCb4bBbEjBkTHlWM1aAaIC
         cAzSycpk8ahliHFTxMVko1Wrm+Q8ha1q9nV74GWakCU6Z4qzsnK3sV3sxc4MiBYIDny6
         KlvBG+N85RV86IuYhumW7MiuiYg479nsj78egZAuMhF+lDk37yU0xDFEO584J1tcaDt+
         bQYeb8EHutOksbzlvfkpfrxZv0tMukmyzQscanKJ/KcnoUCKsmHnV44nc0gqJK7HR3Rk
         8nKA==
X-Gm-Message-State: AOJu0YyI8snVuCO6aTfkzHIAnPLlM9pjb4TR1V+KpdetQCEPZjuEgWwA
	p2JwYBVoF3KR0K0ke8MwK2kP71ELhS52UkKBdbmT0iRa0gTSUeDB51ZuEmjG3S/60pe43zPhc/f
	NO+Tymbf2WOuta+VdZ2lI0tKAmK8vKLqSwg==
X-Received: by 2002:a5d:4144:0:b0:321:7093:53f5 with SMTP id c4-20020a5d4144000000b00321709353f5mr18378292wrq.64.1697055245061;
        Wed, 11 Oct 2023 13:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDVzXaeSLUVEoCnw2UAo6iKt9jxQ17vXIs1dEITlvdg+OItUIf+dCXZJH/BobndiMsa0JfRw==
X-Received: by 2002:a5d:4144:0:b0:321:7093:53f5 with SMTP id c4-20020a5d4144000000b00321709353f5mr18378281wrq.64.1697055244352;
        Wed, 11 Oct 2023 13:14:04 -0700 (PDT)
Date: Wed, 11 Oct 2023 16:14:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231011155531-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Oct 11, 2023 at 10:47:23AM +0000, Parav Pandit wrote:
> 
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 11, 2023 8:44 AM
> > 
> > On Tue, Oct 10, 2023 at 3:19 PM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, October 10, 2023 11:21 AM
> > > >
> > > > On Mon, Oct 9, 2023 at 6:06 PM Parav Pandit <parav@nvidia.com> wrote:
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, October 9, 2023 2:19 PM
> > > > > >
> > > > > > Adding LingShan.
> > > > > >
> > > > > Thanks for adding him.
> > > > >
> > > > > > Parav, if you want any specific people to comment, please do cc them.
> > > > > >
> > > > > Sure, will cc them in v2 as now I see there is interest in the review.
> > > > >
> > > > > > On Sun, Oct 8, 2023 at 7:26 PM Parav Pandit <parav@nvidia.com> wrote:
> > > > > > >
> > > > > > > One or more passthrough PCI VF devices are ubiquitous for
> > > > > > > virtual machines usage using generic kernel framework such as vfio [1].
> > > > > >
> > > > > > Mentioning a specific subsystem in a specific OS may mislead the
> > > > > > user to think it can only work in that setup. Let's not do that,
> > > > > > virtio is not only used for Linux and VFIO.
> > > > > >
> > > > > Not really. it is an example in the cover letter.
> > > > > It is not the only use case.
> > > > > A use case gives a crisp clarity of what UAPI it needs to fulfil.
> > > > > So I will keep it. It is anyway written as one use case.
> > > > >
> > > > > > >
> > > > > > > A passthrough PCI VF device is fully owned by the virtual
> > > > > > > machine device driver.
> > > > > >
> > > > > > Is this true? Even VFIO needs to mediate PCI stuff. Or how do
> > > > > > you define "passthrough" here?
> > > > > >
> > > > > Other than PCI config registers and due to some legacy, msix.
> > > > > The "device interface" side is not mediated.
> > > > > The definition of passthrough here is: To not mediate a device
> > > > > type specific
> > > > and virtio specific interfaces for modern and future devices.
> > > >
> > > > Ok, but what's the difference between "device type specific" and
> > > > "virtio specific interfaces". Maybe an example for this?
> > > >
> > > Virtio device specific means: cvq of crypto device, cvq of net device, flow filter
> > vqs of net device etc.
> > > Virtio specific interface: virtio driver notifications, virtio virtqueue and
> > configuration mediation etc.
> > >
> > > > >
> > > > > > > This passthrough device controls its own device reset flow,
> > > > > > > basic functionality as PCI VF function level reset
> > > > > >
> > > > > > How about other PCI stuff? Or Why is FLR special?
> > > > > FLR is special for the readers to get the clarity that FLR is also
> > > > > done by the
> > > > guest driver hence, the device migration commands do not
> > > > interact/depend with FLR flow.
> > > >
> > > > It's still not clear to me how this is done.
> > > >
> > > > 1) guest starts FLR
> > > > 2) adminq freeze the VF
> > > > 3) FLR is done
> > > >
> > > > If the freezing doesn't wait for the FLR, does it mean we need to
> > > > migrate to a state like FLR is pending? If yes, do we need to
> > > > migrate the other sub states like this? If not, why?
> > > >
> > > In most practical cases #2 followed by #1 should not happen as on the source
> > side the expected is mode change to stop from active.
> > 
> > How does the hypervisor know if a guest is doing what without trapping?
> >
> Hypervisor does not know. The device knows being the recipient of #1 and #2.
>  
> > > But ok, since we active to freeze mode change is allowed, lets discuss above.
> > >
> > > A device is the single synchronization point for any device reset, FLR or admin
> > command operation.
> > 
> > So you agree we need synchronization? And I'm not sure I get the meaning of
> > synchronization point, do you mean the synchronization between freeze/stop
> > and virtio facilities?
> >
> Synchronization means, handling two events in parallel such as FLR and other.
>  
> > > So, the migration driver do not need to wait for FLR to complete.
> > 
> > I'm confused, you said below that device context could be changed by FLR.
> > 
> Yes.
> > If FLR needs to clear device context, we can have a race where device context is
> > cleared when we are trying to read it?
> > 
> I didn’t say clear the context.
> FLR updates the device context.
> Device is serving the device context read write commands, serving FLR, answering mode change command,
> So device knows the best how to avoid any race.

Heh well but if drivers depend on specific behaviour then we really
need to document that in the spec.

> > > When admin cmd freeze the VF it can expect FLR_completed VF.
> > 
> > We need to explain why and how about the resume? For example, is resuming
> > required to wait for the completion of FLR, if not, why?
> > 
> > > Secondly since the FLR is local to the source, intermediate sub state does not
> > migrate.
> > >
> > > But I agree, it is worth to have the text capturing this.
> > >
> > > > >
> > > > > >
> > > > > > > and rest of the virtio device functionality such as control
> > > > > > > vq,
> > > > > >
> > > > > > What do you mean by "rest of"?
> > > > > >
> > > > > As given in the example cvq.
> > > > >
> > > > > > Which part is not controlled and why?
> > > > > Not controlled because as states, it is passthrough device.
> > > > >
> > > > > > > config space access, data path descriptors handling.
> > > > > > >
> > > > > > > Additionally, VM live migration using a precopy method is also
> > > > > > > widely
> > > > used.
> > > > > >
> > > > > > Why is this mentioned here?
> > > > > >
> > > > > Huh. You should be positive for bringing clarity to the readers on
> > > > understanding the use case.
> > > > > And you seem opposite, but ok.
> > > > >
> > > > > As stated, it for the reader to understand the use case and see
> > > > > how proposed
> > > > commands addresses the use case.
> > > >
> > > > The problem is that the hardware features should be designed for a
> > > > general purpose instead of a specific technology if it can. The only
> > > > missing part for post copy is the page fault.
> > > >
> > > Ok. The use case and requirement of member device passthrough is clear to
> > most reviewers now.
> > 
> > In another thread you are saying that the PCI composition is done by hypervisor,
> > so passthrough is really confusing at least for me.
> >
> I explained there what vPCI composition is done there.
> PCI config space and msix side of composition is done.
> The whole virtio interface is not composed.
>  
> > > Ok. I assume "reset flow" is clear to you now that it points to section 2.4.
> > > This section is not normative section, so using an extra word like "flow" does
> > not confuse anyone.
> > > I will link to the section anyway.
> > 
> > Probably, but you mention FLR flow as well.
> As I said, not repeating the PCIe spec here. The reader knows what FLR of the PCIe transport.

What I worry about however, is what happens for example if FLR
is triggered while an admin command is in progress.
This applies to things like legacy admin commands by the way.


> > 
> > >
> > > > >
> > > > > > > and may also undergo PCI function level
> > > > > > > +reset(FLR) flow.
> > > > > >
> > > > > > Why is only FLR special here? I've asked FRS but you ignore the question.
> > > > > >
> > > > > FLR is special to bring clarity that guest owns the VF doing FLR,
> > > > > hence
> > > > hypervisor cannot mediate any registers of the VF.
> > > >
> > > > It's not about mediation at all, it's about how the device can
> > > > implement what you want here correctly.
> > > >
> > > > See my above question.
> > > >
> > > Ok. it is clear that live migration commands cannot stay on the member device
> > because the member device can undergo device reset and FLR flows owned by
> > the guest.
> > 
> > I disagree, hypervisors can emulate FLR and never send FLR to real devices.
> > 
> That would be some other trap alternative that needs to dissect the device and build infrastructure for such dissection is not desired in the listed use case.
> Here we are addressing the requirement of passthrough the device.
> 
> So your disagreement is fine for non-passthrough devices.
> 
> > > (and hypervisor is not involved in these two flows, hence the admin command
> > interface is designed such that it can fullfil above requirements).
> > >
> > > Theory of operation brings out this clarity. Please notice that it is in
> > introductory section with an example.
> > > Not normative line.
> > >
> > > > >
> > > > > > > Such flows must comply to the PCI standard and also
> > > > > > > +virtio specification;
> > > > > >
> > > > > > This seems unnecessary and obvious as it applies to all other
> > > > > > PCI and virtio functionality.
> > > > > >
> > > > > Great. But your comment is contradicts.
> > > > >
> > > > > > What's more, for the things that need to be synchronized, I
> > > > > > don't see any descriptions in this patch. And if it doesn't need, why?
> > > > > With which operation should it be synchronized and why?
> > > > > Can you please be specific?
> > > >
> > > > See my above question regarding FLR. And it may have others which I
> > > > haven't had time to audit.
> > > >
> > > Ok. when you get chance to audit, lets discuss that time.
> > 
> > Well, I'm not the author of this series, it should be your job otherwise it would
> > be too late.
> > 
> As author, what we think, I will cover. If you have specific points to add value, please share, I will look into it.
> 
> > For example, how is the power management interaction with the freeze/stop?
> >
> Power management is owned by the guest, like any other virtio interface.
> So freeze/stop do not interfere with it.

I am not sure what exactly all this means though.
Should be clarified, in some way.

> > >
> > > > >
> > > > > It is not written in this series, because we believe it must not
> > > > > be synchronized
> > > > as it is fully controlled by the guest.
> > > > >
> > > > > >
> > > > > > > at the same time such flows must not obstruct
> > > > > > > +the device migration flow. In such a scenario, a group owner
> > > > > > > +device can provide the administration command interface to
> > > > > > > +facilitate the device migration related operations.
> > > > > > > +
> > > > > > > +When a virtual machine migrates from one hypervisor to
> > > > > > > +another hypervisor, these hypervisors are named as source and
> > > > > > > +destination
> > > > > > hypervisor respectively.
> > > > > > > +In such a scenario, a source hypervisor administers the
> > > > > > > +member device to suspend the device and preserves the device
> > context.
> > > > > > > +Subsequently, a destination hypervisor administers the member
> > > > > > > +device to setup a device context and resumes the member device.
> > > > > > > +The source hypervisor reads the member device context and the
> > > > > > > +destination hypervisor writes the member device context. The
> > > > > > > +method to transfer the member device context from the source
> > > > > > > +to the destination hypervisor is
> > > > > > outside the scope of this specification.
> > > > > > > +
> > > > > > > +The member device can be in any of the three migration modes.
> > > > > > > +The owner driver sets the member device in one of the
> > > > > > > +following modes during
> > > > > > device migration flow.
> > > > > > > +
> > > > > > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Value & Name
> > > > > > > +& Description \\ \hline \hline
> > > > > > > +0x0   & Active &
> > > > > > > +  It is the default mode after instantiation of the member
> > > > > > > +device. \\
> > > > > >
> > > > > > I don't think we ever define "instantiation" anywhere.
> > > > > >
> > > > > Well a transport has implicit definition of the instantiation already.
> > > > > May be a text can be added, but don’t see a value in duplicating
> > > > > PCI spec
> > > > here.
> > > >
> > > > Ok, maybe something like "transport specific instantiation"
> > > >
> > > Ok. that’s a good text. I will change to it.
> > >
> > > > >
> > > > > > > +\hline
> > > > > > > +0x1   & Stop &
> > > > > > > + In this mode, the member device does not send any
> > > > > > > +notifications, and it does not access any driver memory.
> > > > > >
> > > > > > What's the meaning of "driver memory"?
> > > > > >
> > > > > May be guest memory? Or do you suggest a better naming for the
> > > > > memory
> > > > allocated by the guest driver?
> > > >
> > > > Virtqueue?
> > > >
> > > Virtqueue and any memory referred by the virtqueue.
> > >
> > > This is good text, I will change to it.
> > >
> > > > >
> > > > > > And stop seems to be a source of inflight buffers.
> > > > > >
> > > > > I didn’t follow it.
> > > > > If you mean without stop there are no inflight buffer, then I don’t agree.
> > > > > We don’t want to violate the spec by having descriptors with zero
> > > > > size
> > > > returned.
> > > > > Stop is not the source of inflight descriptors.
> > > >
> > > > I think not since you forbid access to the used ring here. So even
> > > > if the buffer were processed by the device it can't be added back to
> > > > the used ring thus became inflight ones.
> > > >
> > > > >
> > > > > There are inflight descriptors with the device that are not yet
> > > > > returned to the
> > > > driver, and device wont return them as zero size wrong completions.
> > > > >
> > > > > > > + The member device may receive driver notifications in this
> > > > > > > + mode,
> > > > > >
> > > > > > What's the meaning of "receive"? For example if the device can
> > > > > > still process buffers, "stop" is not accurate.
> > > > > >
> > > > > Receive means, driver can send the notification as PCIe TLP that
> > > > > device may
> > > > receive as incoming PCIe TLP.
> > > >
> > > > Ok, so this is the transport level. But the device can keep processing the
> > queue?
> > > >
> > > Device cannot process the queue because it does not initiate any read/write
> > towards the virtqueue.
> > 
> > Read/Write only results in a driver noticeable behaviour, it doesn't mean the
> > device can't process the buffers.  For example, devices can keep processing
> > available buffers and make them as inflight ones.
> > 
> The idea is to stop the device and prepare for the migration, so the command to do so.
> Otherwise just the keep the device in active mode and avoid the complications.
> 
> > >
> > > > >
> > > > > In "stop" mode, the device wont process descriptors.
> > > >
> > > > If the device won't process descriptors, why still allow it to receive
> > notifications?
> > > Because notification may still arrive and if the device may update any
> > > counters as part of
> > 
> > Which counters did you mean here?
> >
> The counter that Xuan is adding and any other state that device may have to update as result of driver notification.
> For example caching the posted avail index in the notification.
>  
> > > it which needs to be migrated or store the received notification.
> > >
> > > > Or does it really matter if the device can receive or not here?
> > > >
> > > From device point of view, the device is given the chance to update its device
> > context as part of notifications or access to it.
> > 
> > This is in conflict with what you said above " Device cannot process the queue
> > ..."
> > 
> No, it does not.
> Device context is updated within the device without accessing the queue memory of the guest.
> 
> > Maybe you can give a concrete example.
> > 
> The above one.
> 
> > >
> > > > >
> > > > > > > + the member device context
> > > > > >
> > > > > > I don't think we define "device context" anywhere.
> > > > > >
> > > > > It is defined further in the description.
> > > >
> > > > Like this?
> > > >
> > > > """
> > > >  +The member device has a device context which the owner driver can
> > > > +either read or write. The member device context consist of any
> > > > device  +specific data which is needed by the device to resume its
> > > > operation  +when the device mode """
> > > >
> > > Yes.
> > > Further patch-3 adds the device context and also add the link to it in the
> > theory of operation section so reader can read more detail about it.
> > >
> > > > "Any" is probably too hard for vendors to implement. And in patch 3
> > > > I only see virtio device context. Does this mean we don't need
> > > > transport
> > > > (PCI) context at all? If yes, how can it work?
> > > >
> > > Right. PCI member device is present at source and destination with its layout,
> > only the virtio device context is transferred.
> > > Which part cannot work?
> > 
> > It is explained in another thread where you are saying the PCI requires
> > mediation. I think any author should not ignore such important assumptions in
> > both the change log and the patch.
> > 
> > And again, the more I review the more I see how narrow this series can be used:
> >
> I explained this before and also covered in the cover letter.
>  
> > 1) Only works for SR-IOV member device like VF
> It can be extended to SIOV member device in future.
> Today these are the only type of member device virtio has.
> 
> > 2) Mediate PCI but not virtio which is tricky
> > 3) Can only work for a specific BAR/capability register layout
> > 
> > Only 1) is described in the change log.
> > 
> > The other important assumptions like 2) and 3) are not documented anywhere.
> > And this patch never explains why 2) and 3) is needed or why it can be used for
> > subsystems other than VFIO/Linux.
> >
> Since I am not mentioning vfio now, I will refrain from mentioning others as well. :)
>  
> > >
> > > > >
> > > > > > >and device configuration space may change. \\
> > > > > > > +\hline
> > > > > >
> > > > > > I still don't get why we need a "stop" state in the middle.
> > > > > >
> > > > > All pci devices which belong to a single guest VM are not stopped
> > atomically.
> > > > > Hence, one device which is in freeze mode, may still receive
> > > > > driver notifications from other pci device,
> > > >
> > > > Device may choose to ignore those notifications, no?
> > > >
> > > > > or it may experience a read from the shared memory and get garbage
> > data.
> > > >
> > > > Could you give me an example for this?
> > > >
> > > Section 2.10 Shared Memory Regions.
> > 
> > How can it experience a read in this case?
> >
> MMIO read/write can be initiated by the peer device while the device is in stopped state.

worth mentioning

> > Btw, shared regions are tricky for hardware.
> > 
> > >
> > > > > And things can break.
> > > > > Hence the stop mode, ensures that all the devices get enough
> > > > > chance to stop
> > > > themselves, and later when freezed, to not change anything internally.
> > > > >
> > > > > > > +0x2   & Freeze &
> > > > > > > + In this mode, the member device does not accept any driver
> > > > > > > +notifications,
> > > > > >
> > > > > > This is too vague. Is the device allowed to be freezed in the
> > > > > > middle of any virtio or PCI operations?
> > > > > >
> > > > > > For example, in the middle of feature negotiation etc. It may
> > > > > > cause implementation specific sub-states which can't be migrated easily.
> > > > > >
> > > > > Yes. it is allowed in middle of feature negotiation, for sure.
> > > > > It is passthrough device, hence hypervisor layer do not get to see sub-
> > state.
> > > > >
> > > > > Not sure why you comment, why it cannot be migrated easily.
> > > > > The device context already covers this sub-state.
> > > >
> > > > 1) driver writes driver_features
> > > > 2) driver sets FEAUTRES_OK
> > > >
> > > > 3) device receive driver_features
> > > > 4) device validating driver_features
> > > > 5) device clears FEATURES_OK
> > > >
> > > > 6) driver read stats and realize FEATURES_OK is being cleared
> > > >
> > > > Is it valid to be frozen of the above?
> > > No. device mode is frozen when hypervisor is sure that no more access by the
> > guest will be done.
> > 
> > How, you don't trap so 1) and 2) are posted, how can hypervisor know if there's
> > inflight transactions to any registers?
> > 
> Because hypervisor has stopped the vcpus which are issuing them.
> 
> > > What can happen between #2 and #3, is device mode may change to stop.
> > 
> > Why can't be freezed in this case? It's really hard to deduce why it can't just
> > from your above descriptions.
> >
> On the source hypervisor, the mode changes are active->stop->freeze.
> Hence when freeze is done, the hypervisor knows that all inflight has been stopped by now.
>  
> > Even if it had, is it even possible to list all the places where freezing is
> > prohibited? We don't want to end up with a spec that is hard to implement or
> > leave the vendor to figure out those tricky parts.
> >
> The general idea is not prohibiting the freeze/stop mode.
> If the device needs more time, let device take time to do it.
> 
>  
> > > And in stop mode, device context would capture #5 or #4, depending where is
> > device at that point.
> > >
> > > > >
> > > > > > And what's more, the above state machine seems to be virtio
> > > > > > specific, but you don't explain the interaction with the device
> > > > > > status state
> > > > machine.
> > > > > First, above is not a state machine.
> > > >
> > > > So how do readers know if a state can go to another state and when?
> > > >
> > > Not sure what you mean by reader. Can you please explain.
> > 
> > The people who read virtio spec.
> > 
> So question is "how reader knows if a state can go to another state and when"?
> It is described and listed in the table, when a mode can change.
> 
> > > > So only the driver notification is allowed by not config write?
> > > > What's the consideration for allowing driver notification?
> > > >
> > > Because for most practical purposes, peer device wants to queue blk, net
> > other requests and not do device configuration.
> > 
> > You forbid the device to process the queue but only allow the notification. How
> > can the device queue those requests? The device can just do the available
> > buffer check after resume, then it's all fine.
> >
> Device can always decide to not queue the request and do the available buffer check later.
> The peer device may read also from MMIO space.
> 
> So the intermediate step covers this aspect where device_type specific plumbing is not done.
> Its generic. A device may choose to omit such doorbells as well as long as it knows it can resume.

all this is kind of vague ... should be in the spec.

> > >
> > > Do you know any device configuration space which is RW?
> > > For net and blk I recall it as RO?
> > 
> > For example, WCE. What's more important, the spec allows config space to be
> > RW, so even if there's no examples before, it doesn't mean we won't have a RW
> > in the future.
> > 
> Ok.
> 
> > >
> > > > Let me ask differently, similar to FLR, what happens if the driver
> > > > wants a virtio reset but the hypervisor wants to stop or freeze?
> > > >
> > > The device would respond to stop/freeze request when it has internally
> > started the reset, as device is the single synchronization point which knows how
> > to handle both in parallel.
> > 
> > Let's define the synchronization point first. And it demonstrates at least devices
> > need to synchronize between the free/stop and virtio device status machine
> > which is not as easy as what is done in this patch.
> >
> Synchronization point = device.

Then we need to spec device behaviour.

> > >
> > > > > We would enrich the device context for this, but no need to
> > > > > connects the
> > > > admin mode controlled by the owner device with operational state
> > > > (device_status) owned by the member device.
> > > > >
> > > > > > > + it ignores any device configuration space writes,
> > > > > >
> > > > > > How about read and the device configuration changes?
> > > > > >
> > > > > As listed, device do not have any changes.
> > > > > So device configuration change cannot occur.
> > > >
> > > > It's not necessarily caused by config write, it could be things like
> > > > link status or geometry changes that are initiated from the device.
> > > >
> > > I understand it. Link status was one example, you listed other examples too.
> > > The point is, when in freeze mode, the member device is frozen, hence,
> > device won't initiate those changes.
> > >
> > > > >
> > > > > The device requirements cover this content more explicitly:
> > > > >
> > > > > For the SR-IOV group type, regardless of the member device mode,
> > > > > all the PCI transport level registers MUST be always accessible
> > > > > and the member device MUST function the same way for all the PCI
> > > > > transport level
> > > > registers regardless of the member device mode.
> > > > >
> > > > > > > + the device do not have any changes in the device context.
> > > > > > > + The member device is not accessed in the system through the
> > > > > > > + virtio
> > > > interface.
> > > > > > > + \\
> > > > > >
> > > > > > But accessible via PCI interface?
> > > > > >
> > > > > Yes, as usual.
> > > > >
> > > > > > For example, what happens if we want to freeze during FLR? Does
> > > > > > the hypervisor need to wait for the FLR to be completed?
> > > > > >
> > > > > Hypervisor do not need wait for the FLR to be completed.
> > > >
> > > > So does FLR change device context?
> > > Yes.
> > 
> > So this implies the freeze needs to wait for FLR otherwise device context may
> > change.
> > 
> Device context can change anytime and reflect what is latest.
> I will update the patches to reflect that device is the single synchronization point serving flr, mode changes.
> 
> > >
> > > >
> > > > >
> > > > > > > +\hline
> > > > > > > +\hline
> > > > > > > +0x03-0xFF   & -    & reserved for future use \\
> > > > > > > +\hline
> > > > > > > +\end{tabularx}
> > > > > > > +
> > > > > > > +When the owner driver wants to stop the operation of the
> > > > > > > +device, the owner driver sets the device mode to
> > > > > > > +\field{Stop}. Once the device is in the \field{Stop} mode,
> > > > > > > +the device does not initiate any notifications or does not
> > > > > > > +access any driver memory. Since the member driver may be
> > > > > > > +still active which may send further driver notifications to the device,
> > the device context may be updated.
> > > > > > > +When the member driver has stopped accessing the device, the
> > > > > > > +owner driver sets the device to \field{Freeze} mode
> > > > > > > +indicating to the device that no more driver access occurs.
> > > > > > > +In the \field{Freeze} mode, no more changes occur in the device
> > context.
> > > > > > > +At this point, the device ensures that
> > > > > > there will not be any update to the device context.
> > > > > >
> > > > > > What is missed here are:
> > > > > >
> > > > > > 1) it is a virtio specific states or not
> > > > > It is not.
> > > > >
> > > > > > 2) if it is a virtio specific state, if or how to synchronize
> > > > > > with transport specific interfaces and why
> > > > > > 3) can active go directly to freeze and why
> > > > > >
> > > > > Yes. don’t see a reason to not allow it.
> > > > > Active to freeze mode can change is useful on the destination
> > > > > side, where
> > > > destination hypervisor knows for sure that there is no other entity
> > > > accessing the device.
> > > > > And it needs to setup the device context, it received from the source side.
> > > > > So setting freeze mode can be done directly.
> > > > >
> > > > > > > +
> > > > > > > +The member device has a device context which the owner driver
> > > > > > > +can either read or write. The member device context consist
> > > > > > > +of any device specific data which is needed by the device to
> > > > > > > +resume its operation when the device mode
> > > > > >
> > > > > > This is too vague. There're states that are not suitable for
> > > > > > cmd/queue for
> > > > sure.
> > > > > > I'd split it into
> > > > > >
> > > > > > 1) common states: virtqueue, dirty pages
> > > > > > 2) device specific states: defined be each device
> > > > > >
> > > > > This is theory of operation section. So it capturing such details.
> > > > > Actual device context definition is outside of theory, and precise
> > > > > states of
> > > > virtqueue, device specific, etc are in it.
> > > >
> > > > See my comment above regarding to the device context.
> > > >
> > > I replied above, device context link is added in the patch-3 in the theory of
> > operation.
> > > So reader gets the complete view.
> > >
> > > > >
> > > > > > > +is changed from \field{Stop} to \field{Active} or from
> > > > > > > +\field{Freeze} to \field{Active}.
> > > > > > > +
> > > > > > > +Once the device context is read, it is cleared from the device.
> > > > > >
> > > > > > This is horrible, it means we can't easily
> > > > > >
> > > > > > 1) re-try the migration
> > > > > > 2) recover from migration failure
> > > > > >
> > > > > Can you please explain the flow?
> > > >
> > > > When migration fails, management can choose to resume the device(VM)
> > > > on the source.
> > > >
> > > ok. This should be possible as the management which has the device
> > > context, it can restore it on the source and move the device mode to active.
> > >
> > > > If the state were cleared, it means there's not simple way to resume
> > > > the device but restoring the whole context.
> > > >
> > > Yes, as you say, by restoring the whole context will suffice this corner/rare
> > case scenario.
> > >
> > > > What's the consideration for such clearing?
> > > >
> > > There are two considerations.
> > > 1.  If one does not clear, till how long should it be kept on the device?
> > 
> > Until virtio reset, this is how virtio works now. I've pointed out that it may cause
> > extra troubles when trying to resume, but you don't tell me what's wrong to
> > keep that?
> > 
> If kept, hypervisor may not be able to decide when to change the mode from active->stop.
> We can opt for a mode where full device context is read in each mode without clearing it.
> But than it can be very specific to a version of qemu, which we are avoiding it here.
> 
> > > 2. device context returns incremental value from the previous read. So, it
> > needs to clear it.
> > 
> > I don't understand here. This is not the case for most of the devices.
> >
> Not sure which devices you mean here with "most of the devices".
> Device context functions like a write record pages (aka dirty pages).
> Whatever is already returned is/should not be repeated in subsequent reads, though device can choose to do so.
>  
> > >
> > > > > And which software stack may find this useful?
> > > > > Is there any existing software that can utilize it?
> > > >
> > > > Libvirt.
> > > >
> > > Does libvirt restore on migration failure?
> > 
> > Yes.
> > 
> Ok. the device will be able to resume when it is marked active.
> The device context returned  is the incremental delta as explained above.
> 
> > >
> > > > > Why that device context present with the software vanished, in
> > > > > your
> > > > assumption, if it is?
> > > > >
> > > > > > > Typically, on
> > > > > > > +the source hypervisor, the owner driver reads the device
> > > > > > > +context once when the device is in \field{Active} or
> > > > > > > +\field{Stop} mode and later once the member device is in
> > \field{Freeze} mode.
> > > > > >
> > > > > > Why need the read while device context could be changed? Or is
> > > > > > the dirty page part of the device context?
> > > > > >
> > > > > It is not part of the dirty page.
> > > > > It needs to read in the active/stop mode, so that it can be shared
> > > > > with
> > > > destination hypervisor, which will pre-setup the complex context of
> > > > the device, while it is still running on the source side.
> > > >
> > > > Is such a method used by any hypervisor?
> > > Yes. qemu which uses vfio interface uses it.
> > 
> > Ok, such software technology could be used for all types of devices, I don't see
> > any advantages to mention it here unless it's unique to virtio.
> > 
> It is theory of operation that brings the clarity and rationale.
> So I will keep it.
> 
> > >
> > > >
> > > > >
> > > > > > > +
> > > > > > > +Typically, the device context is read and written one time on
> > > > > > > +the source and the destination hypervisor respectively once
> > > > > > > +the device is in \field{Freeze} mode. On the destination
> > > > > > > +hypervisor, after writing the device context, when the device
> > > > > > > +mode set to \field{Active}, the device uses the most recently
> > > > > > > +set device context and resumes the device
> > > > > > operation.
> > > > > >
> > > > > > There's no context sequence, so this is obvious. It's the
> > > > > > semantic of all other existing interfaces.
> > > > > >
> > > > > Can you please what which existing interfaces do you mean here?
> > > >
> > > > For any common cfg member. E.g queue_addr.
> > > >
> > > > The driver wrote 100 different values to queue_addr and the device
> > > > used the value written last time.
> > > >
> > > o.k. I don’t see any problem in stating what is done, which is less
> > > vague. 😊
> > >
> > > > >
> > > > > > > +
> > > > > > > +In an alternative flow, on the source hypervisor the owner
> > > > > > > +driver may choose to read the device context first time while
> > > > > > > +the device is in \field{Active} mode and second time once the
> > > > > > > +device is in \field{Freeze}
> > > > > > mode.
> > > > > >
> > > > > > Who is going to synchronize the device context with possible
> > > > > > configuration from the driver?
> > > > > >
> > > > > Not sure I understand the question.
> > > > > If I understand you right, do you mean that, When configuration
> > > > > change is done by the guest driver, how does device context change?
> > > > >
> > > >
> > > > Yes.
> > > >
> > > > > If so, device context reading will reflect the new configuration.
> > > >
> > > > How do you do that? For example:
> > > >
> > > > static inline void vp_iowrite64_twopart(u64 val,
> > > >                                         __le32 __iomem *lo,
> > > >                                         __le32 __iomem *hi) {
> > > >         vp_iowrite32((u32)val, lo);
> > > >         vp_iowrite32(val >> 32, hi); }
> > > >
> > > > Is it ok to be freezed in the middle of two vp_iowrite()?
> > > >
> > > Yes. the device context VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG
> > section captures the partial value.
> > 
> > There's no way for the device to know whether or not it's a partial value or not.
> > No?
> > 
> Device does not need to know, because when the guest vm and the device is resumed on the destination, it the guest vm will continue with writing the 2nd part.
> 
> > >
> > > > >
> > > > > > > Similarly, on the
> > > > > > > +destination hypervisor writes the device context first time
> > > > > > > +while the device is still running in \field{Active} mode on
> > > > > > > +the source hypervisor and writes the device context second
> > > > > > > +time while the device is in
> > > > > > \field{Freeze} mode.
> > > > > > > +This flow may result in very short setup time as the device
> > > > > > > +context likely have minimal changes from the previously
> > > > > > > +written device
> > > > context.
> > > > > >
> > > > > > Is the hypervisor who is in charge of doing the comparison and
> > > > > > writing only the delta?
> > > > > >
> > > > > The spec commands allow to do so. So possibility exists from spec wise.
> > > >
> > > > There are various optimizations for migration for sure, I don't
> > > > think mentioning any specific one is good.
> > > >
> > > The text is informative text similar to,
> > >
> > > " However, some devices benefit from the ability to find out the
> > > amount of available data in the queue without accessing the virtqueue in
> > memory"
> > >
> > > " To help with these optimizations, when VIRTIO_F_NOTIFICATION_DATA has
> > been negotiated".
> > >
> > > Is this the only optimization in virtio? No, but we still mention the rationale of
> > why it exists.
> > 
> > The above is a good example as it explain VIRTIO_F_NOTIFICATION_DATA is the
> > only way without accessing the virtqueue. But this is not the case of migration.
> > You said it's just a possibility but not a must which is not the case for
> > VIRTIO_F_NOTIFICATION_DATA.
> > 
> It is one of the optimization apart. The comparison is of one_of_example or not.
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

