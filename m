Return-Path: <virtio-comment-return-7651-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC8CCD80D5
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:00:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 68966747CB
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:00:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4CCA198657D
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:00:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3958398655D; Tue, 10 Oct 2023 14:00:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29975986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 14:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MA-DiGVtPs2DAsuLQaEVQA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696946420; x=1697551220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGYVeRbJ1CnBvVTaGomdXttdFazBqUTyHqVBGw3PtQI=;
        b=CG4ouT4ecOQpFW3FZExtcC1BjozROm/bVe9EeofhPwytABMuIzRhKLq3FwYvFRMTcI
         O4/L6e+YmhsGCjk3OEXwTgjTU4c2oSRzbtvYZxwtGAV1STQQJLJZkpihJl5Q27NUK0n4
         jPCSoMHnCUlyqSE7hTh/TZq0k1WHP6a6xrH5WW88fEMICyqolNTERYqe6IbnzJhIN0BG
         eFGRoStMofg3O2jJqSfQXJIY573awYCEIEavIMjHwLIgVUPmw45rQhwbArabjhKOumJd
         /BCeIm4zgrVFPWKy/F98mc/kQjNSH2aGvCmq+uad2yX94aDtIOxgPXz0S9KbyCCZfNCC
         J5eg==
X-Gm-Message-State: AOJu0YyzGOrv0tcP2ZFlwT6UCghNsDluqEygC8nNSBr+fECDnN7yWwzF
	WWgnthaZ3ZI9hkMfV62T8fl85BoBXZSOD1hIHt5bN3cYpZ83UCFhxzcOmjEVg+HXF7hEqdrL07e
	tb8QTYkxglQjNN8SwLBdZSgM7UaGHTYeCew==
X-Received: by 2002:a5d:6daf:0:b0:32d:62e7:8ff9 with SMTP id u15-20020a5d6daf000000b0032d62e78ff9mr1403742wrs.34.1696946419588;
        Tue, 10 Oct 2023 07:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmImZqHh5jK2hSSHmKXAXg5UcOhPqQoz2DPZIDDcBKvMG0sA1KBGX1ro6SnwE8an7QGMKXmg==
X-Received: by 2002:a5d:6daf:0:b0:32d:62e7:8ff9 with SMTP id u15-20020a5d6daf000000b0032d62e78ff9mr1403694wrs.34.1696946418944;
        Tue, 10 Oct 2023 07:00:18 -0700 (PDT)
Date: Tue, 10 Oct 2023 10:00:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231010095713-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231010083331-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E43F008C4BB0A906074FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E43F008C4BB0A906074FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Oct 10, 2023 at 01:08:22PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, October 10, 2023 6:11 PM
> 
> > All this does beg the question of how is device undergoing flr though and that
> > has to be in a normative statement.
> > 
> Yes, will add.
> 
> > > Further patch-3 adds the device context and also add the link to it in the
> > theory of operation section so reader can read more detail about it.
> > 
> > mention this in the commit log pls
> > 
> Ack. Will add.
> 
> > > > "Any" is probably too hard for vendors to implement. And in patch 3
> > > > I only see virtio device context. Does this mean we don't need
> > > > transport
> > > > (PCI) context at all? If yes, how can it work?
> > > >
> > > Right. PCI member device is present at source and destination with its layout,
> > only the virtio device context is transferred.
> > > Which part cannot work?
> > 
> > 
> > wait don't we need to transfer pci state too? how is that migrated?
> > 
> The hypervisor driver composes the vPCI device. So there isn’t a need to migrate the pci state.
> Only exception is VIRTIO_PCI_CAP_PCI_CFG, which is covered in this v1.
> 

yes but what seems implicit is that device is in some reasonable state
when thing thing happens. e.g. are there no limitations at all e.g. in which
order things happen? can you really first configure virtio
then pci config? for sure?

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
> > > What can happen between #2 and #3, is device mode may change to stop.
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
> > >
> > > > > Second, it is not virtio specific.
> > > >
> > > > It's somehow for sure, for example you said device context need to
> > > > be preserved. And as far as I see the device context is all virtio specific in
> > patch 3.
> > > >
> > > Sure, device context is virtio specific. :) Device context will
> > > reflect if things changed in the stop mode.
> > >
> > > > > It is present in leading OS that has fundamental requirement to
> > > > > support P2P
> > > > devices.
> > > >
> > > > If it's PCI specific, instead of trying to do a workaround in
> > > > virtio, why not invent a mechanism there?
> > > >
> > > It is not a workaround in virtio.
> > > It is the way pci p2p devices work for which one needs to be receptive to
> > handle the interaction.
> > >
> > >
> > > > > Third, it is not, interacing with the _actua_ device status.
> > > > >
> > > > > In "SUSPEND" patch-5, you already asked this question. I assume
> > > > > you asked
> > > > again so that this series is complete.
> > > > >
> > > > > > For example,
> > > > > > what happens if the driver wants to reset but the device is in
> > > > > > stop mode? You told me it is addressed in your series but looks
> > > > > > not. Once you try to describe that, you're actually try to
> > > > > > connect states between the
> > > > two state machines.
> > > > > >
> > > > > As listed in the definition of the stop mode, the device do not
> > > > > act on the
> > > > incoming writes, it only keep tracks of its internal device context
> > > > change as part of this.
> > > >
> > > > So only the driver notification is allowed by not config write?
> > > > What's the consideration for allowing driver notification?
> > > >
> > > Because for most practical purposes, peer device wants to queue blk, net
> > other requests and not do device configuration.
> > >
> > > Do you know any device configuration space which is RW?
> > > For net and blk I recall it as RO?
> > 
> > No it isn't. Pls look at the spec if you need to check that ;)
> > 
> Ok. will check. But regardless, it is fine, because when STOP is done, config writes should not occur anyway.


i don't see a statement like this but maybe i missed it.

> > 
> > > > Let me ask differently, similar to FLR, what happens if the driver
> > > > wants a virtio reset but the hypervisor wants to stop or freeze?
> > > >
> > > The device would respond to stop/freeze request when it has internally
> > started the reset, as device is the single synchronization point which knows how
> > to handle both in parallel.
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
> > > 2. device context returns incremental value from the previous read. So, it
> > needs to clear it.
> > >
> > > > > And which software stack may find this useful?
> > > > > Is there any existing software that can utilize it?
> > > >
> > > > Libvirt.
> > > >
> > > Does libvirt restore on migration failure?
> > 
> > yes
> > 
> Ok. the management sw has access to the context to restore.
> Alternatively, it is the incremental context not available as it is read, but the freeze device still has the frozen context.
> So it can be marked active too.
> I will double check if I captured this in the normative or not.

preferable if context is not erased on the device IMHO.
less of a chance of a failure to resume.

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
> > > As long as the rationale do not confuse the reader, and adds the value
> > explaining how things work, it is fine to add.
> > > Which is what above few lines did.
> > > So let's keep it.
> > >
> > > The easiest is to cut out the whole theory of operation and just write
> > commands like how RSS command did, without even writing a single line about
> > RSS.
> > > I think we can do better explanation than that for new things we add.
> > 
> > yes i find it useful. of course now we are writing it, we also need it not to be
> > confusing or partial.
> Ok. Thanks.


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

