Return-Path: <virtio-comment-return-7643-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE1CD68ED
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 05:51:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 45C9F7E2AC
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 05:51:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2502098655D
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 05:51:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0EF02986478; Tue, 10 Oct 2023 05:51:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2AA7986512
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 05:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W1zYGaMjNwWwYFYw9XLCrg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696917101; x=1697521901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYzG7+Qm2nOZHTNmJwZK48ZbsfRe2p45u0YmRhCVqp0=;
        b=m/ML9grUJw7If97Nq6dld94MofITmePI1H9WSWVnr2w1XyZvwJaRnnbVHE/nXK5koG
         sQOU+GZLjV0jA8rilnX16Cvpt/k7MS+jKhSHaAz/cK649C5HDK4iU5DFMEfVqVvmm0AS
         CsvV9If6pPQ0szEBZLfMkJWGiyptm7haNEugYToaK1QnkD2BdenqRQb7lFbLKN10la68
         TaIWjLejQNSxGlwj4ZNy8Zww41SJTyfhr00fdxR6oUV+Kxgt2K/QoRmv24twFiqAEMTQ
         VwisdCcWD9pKgKCC1LmGEDCnHc5gDqxwQu18Y6h7+Ie5j8Sd8gjVoKkRRSDk/CikDgpa
         FhqQ==
X-Gm-Message-State: AOJu0YztqQfVms+TyXp9Uv9UDroEBShocSVBveenbawr/k2/rV07gIC+
	wTcze24Dk4+mepdQGhpxncha9hxODUmn2YTFF5dzY2mbz87U/QHC2yNjeV4Shr0J57ExBvJW2HG
	pjhSwCjp3iVLynLhUbXKvGLq7bueGMNA0mt/KmrnNXNiMyHONdw==
X-Received: by 2002:a19:5e10:0:b0:503:f:1343 with SMTP id s16-20020a195e10000000b00503000f1343mr11454376lfb.19.1696917100643;
        Mon, 09 Oct 2023 22:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6r/4QFk9c9inzQ3TmrfasO4TUW8QVwvjYdnVXQwK3Nzb5OzABvSfPY+9dKGSrPcP8NwzhYHiNv4u0RyzSsyQ=
X-Received: by 2002:a19:5e10:0:b0:503:f:1343 with SMTP id s16-20020a195e10000000b00503000f1343mr11454364lfb.19.1696917100093;
 Mon, 09 Oct 2023 22:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com> <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Oct 2023 13:51:28 +0800
Message-ID: <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Mon, Oct 9, 2023 at 6:06=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, October 9, 2023 2:19 PM
> >
> > Adding LingShan.
> >
> Thanks for adding him.
>
> > Parav, if you want any specific people to comment, please do cc them.
> >
> Sure, will cc them in v2 as now I see there is interest in the review.
>
> > On Sun, Oct 8, 2023 at 7:26=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > > One or more passthrough PCI VF devices are ubiquitous for virtual
> > > machines usage using generic kernel framework such as vfio [1].
> >
> > Mentioning a specific subsystem in a specific OS may mislead the user t=
o think
> > it can only work in that setup. Let's not do that, virtio is not only u=
sed for Linux
> > and VFIO.
> >
> Not really. it is an example in the cover letter.
> It is not the only use case.
> A use case gives a crisp clarity of what UAPI it needs to fulfil.
> So I will keep it. It is anyway written as one use case.
>
> > >
> > > A passthrough PCI VF device is fully owned by the virtual machine
> > > device driver.
> >
> > Is this true? Even VFIO needs to mediate PCI stuff. Or how do you defin=
e
> > "passthrough" here?
> >
> Other than PCI config registers and due to some legacy, msix.
> The "device interface" side is not mediated.
> The definition of passthrough here is: To not mediate a device type speci=
fic and virtio specific interfaces for modern and future devices.

Ok, but what's the difference between "device type specific" and
"virtio specific interfaces". Maybe an example for this?

>
> > > This passthrough device controls its own device reset flow, basic
> > > functionality as PCI VF function level reset
> >
> > How about other PCI stuff? Or Why is FLR special?
> FLR is special for the readers to get the clarity that FLR is also done b=
y the guest driver hence, the device migration commands do not interact/dep=
end with FLR flow.

It's still not clear to me how this is done.

1) guest starts FLR
2) adminq freeze the VF
3) FLR is done

If the freezing doesn't wait for the FLR, does it mean we need to
migrate to a state like FLR is pending? If yes, do we need to migrate
the other sub states like this? If not, why?

>
> >
> > > and rest of the virtio device functionality such as control vq,
> >
> > What do you mean by "rest of"?
> >
> As given in the example cvq.
>
> > Which part is not controlled and why?
> Not controlled because as states, it is passthrough device.
>
> > > config space access, data path descriptors handling.
> > >
> > > Additionally, VM live migration using a precopy method is also widely=
 used.
> >
> > Why is this mentioned here?
> >
> Huh. You should be positive for bringing clarity to the readers on unders=
tanding the use case.
> And you seem opposite, but ok.
>
> As stated, it for the reader to understand the use case and see how propo=
sed commands addresses the use case.

The problem is that the hardware features should be designed for a
general purpose instead of a specific technology if it can. The only
missing part for post copy is the page fault.

>
> > >
> > > To support a VM live migration for such passthrough virtio devices,
> > > the owner PCI PF device administers the device migration flow.
> >
> > Well, if this is specific only to PCI SR-IOV, I'd move it to the PCI tr=
ansport part.
> > But I guess not.
> We took the decision to not do so, for other group commands as well.
> After Michael's suggestion we moved it to group commands.
> So I will not debate this further.
>
> >
> > >
> > > This patch introduces the basic theory of operation which describes
> > > the flow and supporting administration commands.
> > >
> > > [1]
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/
> > > include/uapi/linux/vfio.h?h=3Dv6.1.47
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  admin-cmds-device-migration.tex | 94
> > +++++++++++++++++++++++++++++++++
> > >  admin.tex                       |  1 +
> > >  2 files changed, 95 insertions(+)
> > >  create mode 100644 admin-cmds-device-migration.tex
> > >
> > > diff --git a/admin-cmds-device-migration.tex
> > > b/admin-cmds-device-migration.tex new file mode 100644 index
> > > 0000000..f839af4
> > > --- /dev/null
> > > +++ b/admin-cmds-device-migration.tex
> > > @@ -0,0 +1,94 @@
> > > +\subsubsection{Device Migration}\label{sec:Basic Facilities of a
> > > +Virtio Device / Device groups / Group administration commands /
> > > +Device Migration}
> > > +
> > > +In some systems, there is a need to migrate a running virtual machin=
e
> > > +from one to another system. A running virtual machine has one or mor=
e
> > > +passthrough virtio member devices attached to it. A passthrough
> > > +device is entirely operated by the guest virtual machine. For
> > > +example, with the SR-IOV group type, group member (VF) may undergo
> > > +virtio device initialization and reset flow
> >
> > What do you mean by "reset flow"? It looks not like a terminology defin=
ed in the
> > PCI spec. And Google gives me nothing about this.
> >
> "reset flow" =3D virtio specification section 2.4 Device Reset flow.

My git repo show it's still called "device reset" and I see you use
"FLR flow" which is also not very clear to me.

>
> > > and may also undergo PCI function level
> > > +reset(FLR) flow.
> >
> > Why is only FLR special here? I've asked FRS but you ignore the questio=
n.
> >
> FLR is special to bring clarity that guest owns the VF doing FLR, hence h=
ypervisor cannot mediate any registers of the VF.

It's not about mediation at all, it's about how the device can
implement what you want here correctly.

See my above question.

>
> > > Such flows must comply to the PCI standard and also
> > > +virtio specification;
> >
> > This seems unnecessary and obvious as it applies to all other PCI and v=
irtio
> > functionality.
> >
> Great. But your comment is contradicts.
>
> > What's more, for the things that need to be synchronized, I don't see a=
ny
> > descriptions in this patch. And if it doesn't need, why?
> With which operation should it be synchronized and why?
> Can you please be specific?

See my above question regarding FLR. And it may have others which I
haven't had time to audit.

>
> It is not written in this series, because we believe it must not be synch=
ronized as it is fully controlled by the guest.
>
> >
> > > at the same time such flows must not obstruct
> > > +the device migration flow. In such a scenario, a group owner device
> > > +can provide the administration command interface to facilitate the
> > > +device migration related operations.
> > > +
> > > +When a virtual machine migrates from one hypervisor to another
> > > +hypervisor, these hypervisors are named as source and destination
> > hypervisor respectively.
> > > +In such a scenario, a source hypervisor administers the member devic=
e
> > > +to suspend the device and preserves the device context.
> > > +Subsequently, a destination hypervisor administers the member device
> > > +to setup a device context and resumes the member device. The source
> > > +hypervisor reads the member device context and the destination
> > > +hypervisor writes the member device context. The method to transfer
> > > +the member device context from the source to the destination hypervi=
sor is
> > outside the scope of this specification.
> > > +
> > > +The member device can be in any of the three migration modes. The
> > > +owner driver sets the member device in one of the following modes du=
ring
> > device migration flow.
> > > +
> > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Value & Name &
> > > +Description \\ \hline \hline
> > > +0x0   & Active &
> > > +  It is the default mode after instantiation of the member device. \=
\
> >
> > I don't think we ever define "instantiation" anywhere.
> >
> Well a transport has implicit definition of the instantiation already.
> May be a text can be added, but don=E2=80=99t see a value in duplicating =
PCI spec here.

Ok, maybe something like "transport specific instantiation"

>
> > > +\hline
> > > +0x1   & Stop &
> > > + In this mode, the member device does not send any notifications,
> > > +and it does not access any driver memory.
> >
> > What's the meaning of "driver memory"?
> >
> May be guest memory? Or do you suggest a better naming for the memory all=
ocated by the guest driver?

Virtqueue?

>
> > And stop seems to be a source of inflight buffers.
> >
> I didn=E2=80=99t follow it.
> If you mean without stop there are no inflight buffer, then I don=E2=80=
=99t agree.
> We don=E2=80=99t want to violate the spec by having descriptors with zero=
 size returned.
> Stop is not the source of inflight descriptors.

I think not since you forbid access to the used ring here. So even if
the buffer were processed by the device it can't be added back to the
used ring thus became inflight ones.

>
> There are inflight descriptors with the device that are not yet returned =
to the driver, and device wont return them as zero size wrong completions.
>
> > > + The member device may receive driver notifications in this mode,
> >
> > What's the meaning of "receive"? For example if the device can still pr=
ocess
> > buffers, "stop" is not accurate.
> >
> Receive means, driver can send the notification as PCIe TLP that device m=
ay receive as incoming PCIe TLP.

Ok, so this is the transport level. But the device can keep processing
the queue?

>
> In "stop" mode, the device wont process descriptors.

If the device won't process descriptors, why still allow it to receive
notifications? Or does it really matter if the device can receive or
not here?

>
> > > + the member device context
> >
> > I don't think we define "device context" anywhere.
> >
> It is defined further in the description.

Like this?

"""
 +The member device has a device context which the owner driver can
 +either read or write. The member device context consist of any device
 +specific data which is needed by the device to resume its operation
 +when the device mode
"""

"Any" is probably too hard for vendors to implement. And in patch 3 I
only see virtio device context. Does this mean we don't need transport
(PCI) context at all? If yes, how can it work?

>
> > >and device configuration space may change. \\
> > > +\hline
> >
> > I still don't get why we need a "stop" state in the middle.
> >
> All pci devices which belong to a single guest VM are not stopped atomica=
lly.
> Hence, one device which is in freeze mode, may still receive driver notif=
ications from other pci device,

Device may choose to ignore those notifications, no?

> or it may experience a read from the shared memory and get garbage data.

Could you give me an example for this?

> And things can break.
> Hence the stop mode, ensures that all the devices get enough chance to st=
op themselves, and later when freezed, to not change anything internally.
>
> > > +0x2   & Freeze &
> > > + In this mode, the member device does not accept any driver
> > > +notifications,
> >
> > This is too vague. Is the device allowed to be freezed in the middle of=
 any virtio
> > or PCI operations?
> >
> > For example, in the middle of feature negotiation etc. It may cause
> > implementation specific sub-states which can't be migrated easily.
> >
> Yes. it is allowed in middle of feature negotiation, for sure.
> It is passthrough device, hence hypervisor layer do not get to see sub-st=
ate.
>
> Not sure why you comment, why it cannot be migrated easily.
> The device context already covers this sub-state.

1) driver writes driver_features
2) driver sets FEAUTRES_OK

3) device receive driver_features
4) device validating driver_features
5) device clears FEATURES_OK

6) driver read stats and realize FEATURES_OK is being cleared

Is it valid to be frozen of the above? If yes, assuming we are
freezing between 2 and 3, what would a device context read gives us
for driver_features?

>
> > And what's more, the above state machine seems to be virtio specific, b=
ut you
> > don't explain the interaction with the device status state machine.
> First, above is not a state machine.

So how do readers know if a state can go to another state and when?

> Second, it is not virtio specific.

It's somehow for sure, for example you said device context need to be
preserved. And as far as I see the device context is all virtio
specific in patch 3.

> It is present in leading OS that has fundamental requirement to support P=
2P devices.

If it's PCI specific, instead of trying to do a workaround in virtio,
why not invent a mechanism there?

> Third, it is not, interacing with the _actua_ device status.
>
> In "SUSPEND" patch-5, you already asked this question. I assume you asked=
 again so that this series is complete.
>
> > For example,
> > what happens if the driver wants to reset but the device is in stop mod=
e? You
> > told me it is addressed in your series but looks not. Once you try to d=
escribe
> > that, you're actually try to connect states between the two state machi=
nes.
> >
> As listed in the definition of the stop mode, the device do not act on th=
e incoming writes, it only keep tracks of its internal device context chang=
e as part of this.

So only the driver notification is allowed by not config write? What's
the consideration for allowing driver notification?

Let me ask differently, similar to FLR, what happens if the driver
wants a virtio reset but the hypervisor wants to stop or freeze?

> We would enrich the device context for this, but no need to connects the =
admin mode controlled by the owner device with operational state (device_st=
atus) owned by the member device.
>
> > > + it ignores any device configuration space writes,
> >
> > How about read and the device configuration changes?
> >
> As listed, device do not have any changes.
> So device configuration change cannot occur.

It's not necessarily caused by config write, it could be things like
link status or geometry changes that are initiated from the device.

>
> The device requirements cover this content more explicitly:
>
> For the SR-IOV group type, regardless of the member device mode, all the =
PCI transport level registers
> MUST be always accessible and the member device MUST function the same wa=
y for all the PCI transport
> level registers regardless of the member device mode.
>
> > > + the device do not have any changes in the device context. The membe=
r
> > > + device is not accessed in the system through the virtio interface.
> > > + \\
> >
> > But accessible via PCI interface?
> >
> Yes, as usual.
>
> > For example, what happens if we want to freeze during FLR? Does the
> > hypervisor need to wait for the FLR to be completed?
> >
> Hypervisor do not need wait for the FLR to be completed.

So does FLR change device context?

>
> > > +\hline
> > > +\hline
> > > +0x03-0xFF   & -    & reserved for future use \\
> > > +\hline
> > > +\end{tabularx}
> > > +
> > > +When the owner driver wants to stop the operation of the device, the
> > > +owner driver sets the device mode to \field{Stop}. Once the device i=
s
> > > +in the \field{Stop} mode, the device does not initiate any
> > > +notifications or does not access any driver memory. Since the member
> > > +driver may be still active which may send further driver
> > > +notifications to the device, the device context may be updated. When
> > > +the member driver has stopped accessing the device, the owner driver
> > > +sets the device to \field{Freeze} mode indicating to the device that
> > > +no more driver access occurs. In the \field{Freeze} mode, no more
> > > +changes occur in the device context. At this point, the device ensur=
es that
> > there will not be any update to the device context.
> >
> > What is missed here are:
> >
> > 1) it is a virtio specific states or not
> It is not.
>
> > 2) if it is a virtio specific state, if or how to synchronize with tran=
sport specific
> > interfaces and why
> > 3) can active go directly to freeze and why
> >
> Yes. don=E2=80=99t see a reason to not allow it.
> Active to freeze mode can change is useful on the destination side, where=
 destination hypervisor knows for sure that there is no other entity access=
ing the device.
> And it needs to setup the device context, it received from the source sid=
e.
> So setting freeze mode can be done directly.
>
> > > +
> > > +The member device has a device context which the owner driver can
> > > +either read or write. The member device context consist of any devic=
e
> > > +specific data which is needed by the device to resume its operation
> > > +when the device mode
> >
> > This is too vague. There're states that are not suitable for cmd/queue =
for sure.
> > I'd split it into
> >
> > 1) common states: virtqueue, dirty pages
> > 2) device specific states: defined be each device
> >
> This is theory of operation section. So it capturing such details.
> Actual device context definition is outside of theory, and precise states=
 of virtqueue, device specific, etc are in it.

See my comment above regarding to the device context.

>
> > > +is changed from \field{Stop} to \field{Active} or from \field{Freeze=
}
> > > +to \field{Active}.
> > > +
> > > +Once the device context is read, it is cleared from the device.
> >
> > This is horrible, it means we can't easily
> >
> > 1) re-try the migration
> > 2) recover from migration failure
> >
> Can you please explain the flow?

When migration fails, management can choose to resume the device(VM)
on the source.

If the state were cleared, it means there's not simple way to resume
the device but restoring the whole context.

What's the consideration for such clearing?

> And which software stack may find this useful?
> Is there any existing software that can utilize it?

Libvirt.

> Why that device context present with the software vanished, in your assum=
ption, if it is?
>
> > > Typically, on
> > > +the source hypervisor, the owner driver reads the device context onc=
e
> > > +when the device is in \field{Active} or \field{Stop} mode and later
> > > +once the member device is in \field{Freeze} mode.
> >
> > Why need the read while device context could be changed? Or is the dirt=
y page
> > part of the device context?
> >
> It is not part of the dirty page.
> It needs to read in the active/stop mode, so that it can be shared with d=
estination hypervisor, which will pre-setup the complex context of the devi=
ce, while it is still running on the source side.

Is such a method used by any hypervisor? If not, let's don't describe
such in-mature optimization in the spec.

>
> > > +
> > > +Typically, the device context is read and written one time on the
> > > +source and the destination hypervisor respectively once the device i=
s
> > > +in \field{Freeze} mode. On the destination hypervisor, after writing
> > > +the device context, when the device mode set to \field{Active}, the
> > > +device uses the most recently set device context and resumes the dev=
ice
> > operation.
> >
> > There's no context sequence, so this is obvious. It's the semantic of a=
ll other
> > existing interfaces.
> >
> Can you please what which existing interfaces do you mean here?

For any common cfg member. E.g queue_addr.

The driver wrote 100 different values to queue_addr and the device
used the value written last time.

>
> > > +
> > > +In an alternative flow, on the source hypervisor the owner driver ma=
y
> > > +choose to read the device context first time while the device is in
> > > +\field{Active} mode and second time once the device is in \field{Fre=
eze}
> > mode.
> >
> > Who is going to synchronize the device context with possible configurat=
ion from
> > the driver?
> >
> Not sure I understand the question.
> If I understand you right, do you mean that,
> When configuration change is done by the guest driver, how does device co=
ntext change?
>

Yes.

> If so, device context reading will reflect the new configuration.

How do you do that? For example:

static inline void vp_iowrite64_twopart(u64 val,
                                        __le32 __iomem *lo,
                                        __le32 __iomem *hi)
{
        vp_iowrite32((u32)val, lo);
        vp_iowrite32(val >> 32, hi);
}

Is it ok to be freezed in the middle of two vp_iowrite()?

>
> > > Similarly, on the
> > > +destination hypervisor writes the device context first time while th=
e
> > > +device is still running in \field{Active} mode on the source
> > > +hypervisor and writes the device context second time while the devic=
e is in
> > \field{Freeze} mode.
> > > +This flow may result in very short setup time as the device context
> > > +likely have minimal changes from the previously written device conte=
xt.
> >
> > Is the hypervisor who is in charge of doing the comparison and writing =
only the
> > delta?
> >
> The spec commands allow to do so. So possibility exists from spec wise.

There are various optimizations for migration for sure, I don't think
mentioning any specific one is good.

Thanks


> In current proposal, there isn=E2=80=99t a need for hypervisor to do so a=
t all.
>
> The destination side device gets to see the new device context and apply =
the delta.


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

