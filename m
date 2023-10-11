Return-Path: <virtio-comment-return-7655-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B39CD98E6
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 03:14:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0D4022368
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 03:14:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC297983B48
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 03:14:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E6DB98643F; Wed, 11 Oct 2023 03:14:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 888239865E0
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 03:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NgOM4JdDO0Kxcbr4mL6zMw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696994068; x=1697598868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8UP4LUK+QcHowM+3zoVYqenYurXO3zVXgY9W0kno0o=;
        b=Qb3YFL5WnAcwdDxv8ERKJOemMsaYpWSMyyjJJOXNU6xHsFiAsWm2DKaePP13ifdX7w
         xdnyky6a/jKUV//Cs2r4gVf5E0MxoqZkxqKfaEQhKi4WpgNjlJ7qfcSyk1BpK3xUfGSJ
         UQXS/KhG8V8JFD0IejGnKOrb3XDwQkhQk0ULV4Kf0M1+L0dmUOEhTXavxlCU3DeRo8VS
         qzrQaHVoPxzA+OdEOU/663zfdKnis1rdS5TLyZpTKLPpvHQzHCHkiBYbkxLEIrvK6qKV
         vgm+P+7xP3+eC6rjVlF7vH5pE27hSf+ZjH0guHjbDkgoh3GheVV1B4jP3BsS/DkQErUu
         cXzA==
X-Gm-Message-State: AOJu0Yw6aa5hbjmFevEWW4WU1Wpx55BWYjWRFDGZqu84Z5G4U5OWm5rY
	I8SGwUKXh33E6fI3WFDY9KtEJJlQcfidzuDZpunAqh79RWEj1tJJL4Rbot1IxTpTxmrbQ2oGdSD
	87oLBcO6th32g+WL+BQmb8GaaJqrCS6KtpoekqDEwTov2XLW0iw==
X-Received: by 2002:a05:6512:370a:b0:503:26bd:7f58 with SMTP id z10-20020a056512370a00b0050326bd7f58mr15518618lfr.41.1696994067230;
        Tue, 10 Oct 2023 20:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWG3oD1YbBVjWYaZzOJWFPFRuVWzG8bgFWxGFk3i+ddHAUvcISqkZZnwcYWq0jS2H6EvTlDV9v4gdmxautIKQ=
X-Received: by 2002:a05:6512:370a:b0:503:26bd:7f58 with SMTP id
 z10-20020a056512370a00b0050326bd7f58mr15518602lfr.41.1696994066595; Tue, 10
 Oct 2023 20:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com> <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 Oct 2023 11:14:14 +0800
Message-ID: <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
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

On Tue, Oct 10, 2023 at 3:19=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 10, 2023 11:21 AM
> >
> > On Mon, Oct 9, 2023 at 6:06=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, October 9, 2023 2:19 PM
> > > >
> > > > Adding LingShan.
> > > >
> > > Thanks for adding him.
> > >
> > > > Parav, if you want any specific people to comment, please do cc the=
m.
> > > >
> > > Sure, will cc them in v2 as now I see there is interest in the review=
.
> > >
> > > > On Sun, Oct 8, 2023 at 7:26=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > > One or more passthrough PCI VF devices are ubiquitous for virtual
> > > > > machines usage using generic kernel framework such as vfio [1].
> > > >
> > > > Mentioning a specific subsystem in a specific OS may mislead the
> > > > user to think it can only work in that setup. Let's not do that,
> > > > virtio is not only used for Linux and VFIO.
> > > >
> > > Not really. it is an example in the cover letter.
> > > It is not the only use case.
> > > A use case gives a crisp clarity of what UAPI it needs to fulfil.
> > > So I will keep it. It is anyway written as one use case.
> > >
> > > > >
> > > > > A passthrough PCI VF device is fully owned by the virtual machine
> > > > > device driver.
> > > >
> > > > Is this true? Even VFIO needs to mediate PCI stuff. Or how do you
> > > > define "passthrough" here?
> > > >
> > > Other than PCI config registers and due to some legacy, msix.
> > > The "device interface" side is not mediated.
> > > The definition of passthrough here is: To not mediate a device type s=
pecific
> > and virtio specific interfaces for modern and future devices.
> >
> > Ok, but what's the difference between "device type specific" and "virti=
o specific
> > interfaces". Maybe an example for this?
> >
> Virtio device specific means: cvq of crypto device, cvq of net device, fl=
ow filter vqs of net device etc.
> Virtio specific interface: virtio driver notifications, virtio virtqueue =
and configuration mediation etc.
>
> > >
> > > > > This passthrough device controls its own device reset flow, basic
> > > > > functionality as PCI VF function level reset
> > > >
> > > > How about other PCI stuff? Or Why is FLR special?
> > > FLR is special for the readers to get the clarity that FLR is also do=
ne by the
> > guest driver hence, the device migration commands do not interact/depen=
d
> > with FLR flow.
> >
> > It's still not clear to me how this is done.
> >
> > 1) guest starts FLR
> > 2) adminq freeze the VF
> > 3) FLR is done
> >
> > If the freezing doesn't wait for the FLR, does it mean we need to migra=
te to a
> > state like FLR is pending? If yes, do we need to migrate the other sub =
states like
> > this? If not, why?
> >
> In most practical cases #2 followed by #1 should not happen as on the sou=
rce side the expected is mode change to stop from active.

How does the hypervisor know if a guest is doing what without trapping?

> But ok, since we active to freeze mode change is allowed, lets discuss ab=
ove.
>
> A device is the single synchronization point for any device reset, FLR or=
 admin command operation.

So you agree we need synchronization? And I'm not sure I get the
meaning of synchronization point, do you mean the synchronization
between freeze/stop and virtio facilities?

> So, the migration driver do not need to wait for FLR to complete.

I'm confused, you said below that device context could be changed by FLR.

If FLR needs to clear device context, we can have a race where device
context is cleared when we are trying to read it?

> When admin cmd freeze the VF it can expect FLR_completed VF.

We need to explain why and how about the resume? For example, is
resuming required to wait for the completion of FLR, if not, why?

> Secondly since the FLR is local to the source, intermediate sub state doe=
s not migrate.
>
> But I agree, it is worth to have the text capturing this.
>
> > >
> > > >
> > > > > and rest of the virtio device functionality such as control vq,
> > > >
> > > > What do you mean by "rest of"?
> > > >
> > > As given in the example cvq.
> > >
> > > > Which part is not controlled and why?
> > > Not controlled because as states, it is passthrough device.
> > >
> > > > > config space access, data path descriptors handling.
> > > > >
> > > > > Additionally, VM live migration using a precopy method is also wi=
dely
> > used.
> > > >
> > > > Why is this mentioned here?
> > > >
> > > Huh. You should be positive for bringing clarity to the readers on
> > understanding the use case.
> > > And you seem opposite, but ok.
> > >
> > > As stated, it for the reader to understand the use case and see how p=
roposed
> > commands addresses the use case.
> >
> > The problem is that the hardware features should be designed for a gene=
ral
> > purpose instead of a specific technology if it can. The only missing pa=
rt for post
> > copy is the page fault.
> >
> Ok. The use case and requirement of member device passthrough is clear to=
 most reviewers now.

In another thread you are saying that the PCI composition is done by
hypervisor, so passthrough is really confusing at least for me.

> So I will remove it from commit log.
>
> > >
> > > > >
> > > > > To support a VM live migration for such passthrough virtio
> > > > > devices, the owner PCI PF device administers the device migration=
 flow.
> > > >
> > > > Well, if this is specific only to PCI SR-IOV, I'd move it to the PC=
I transport
> > part.
> > > > But I guess not.
> > > We took the decision to not do so, for other group commands as well.
> > > After Michael's suggestion we moved it to group commands.
> > > So I will not debate this further.
> > >
> > > >
> > > > >
> > > > > This patch introduces the basic theory of operation which
> > > > > describes the flow and supporting administration commands.
> > > > >
> > > > > [1]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
t
> > > > > ree/
> > > > > include/uapi/linux/vfio.h?h=3Dv6.1.47
> > > > >
> > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > ---
> > > > >  admin-cmds-device-migration.tex | 94
> > > > +++++++++++++++++++++++++++++++++
> > > > >  admin.tex                       |  1 +
> > > > >  2 files changed, 95 insertions(+)  create mode 100644
> > > > > admin-cmds-device-migration.tex
> > > > >
> > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > b/admin-cmds-device-migration.tex new file mode 100644 index
> > > > > 0000000..f839af4
> > > > > --- /dev/null
> > > > > +++ b/admin-cmds-device-migration.tex
> > > > > @@ -0,0 +1,94 @@
> > > > > +\subsubsection{Device Migration}\label{sec:Basic Facilities of a
> > > > > +Virtio Device / Device groups / Group administration commands /
> > > > > +Device Migration}
> > > > > +
> > > > > +In some systems, there is a need to migrate a running virtual
> > > > > +machine from one to another system. A running virtual machine ha=
s
> > > > > +one or more passthrough virtio member devices attached to it. A
> > > > > +passthrough device is entirely operated by the guest virtual
> > > > > +machine. For example, with the SR-IOV group type, group member
> > > > > +(VF) may undergo virtio device initialization and reset flow
> > > >
> > > > What do you mean by "reset flow"? It looks not like a terminology
> > > > defined in the PCI spec. And Google gives me nothing about this.
> > > >
> > > "reset flow" =3D virtio specification section 2.4 Device Reset flow.
> >
> > My git repo show it's still called "device reset" and I see you use "FL=
R flow"
> > which is also not very clear to me.
> >
> Ok. I assume "reset flow" is clear to you now that it points to section 2=
.4.
> This section is not normative section, so using an extra word like "flow"=
 does not confuse anyone.
> I will link to the section anyway.

Probably, but you mention FLR flow as well.

>
> > >
> > > > > and may also undergo PCI function level
> > > > > +reset(FLR) flow.
> > > >
> > > > Why is only FLR special here? I've asked FRS but you ignore the que=
stion.
> > > >
> > > FLR is special to bring clarity that guest owns the VF doing FLR, hen=
ce
> > hypervisor cannot mediate any registers of the VF.
> >
> > It's not about mediation at all, it's about how the device can implemen=
t what
> > you want here correctly.
> >
> > See my above question.
> >
> Ok. it is clear that live migration commands cannot stay on the member de=
vice because the member device can undergo device reset and FLR flows owned=
 by the guest.

I disagree, hypervisors can emulate FLR and never send FLR to real devices.

> (and hypervisor is not involved in these two flows, hence the admin comma=
nd interface is designed such that it can fullfil above requirements).
>
> Theory of operation brings out this clarity. Please notice that it is in =
introductory section with an example.
> Not normative line.
>
> > >
> > > > > Such flows must comply to the PCI standard and also
> > > > > +virtio specification;
> > > >
> > > > This seems unnecessary and obvious as it applies to all other PCI
> > > > and virtio functionality.
> > > >
> > > Great. But your comment is contradicts.
> > >
> > > > What's more, for the things that need to be synchronized, I don't
> > > > see any descriptions in this patch. And if it doesn't need, why?
> > > With which operation should it be synchronized and why?
> > > Can you please be specific?
> >
> > See my above question regarding FLR. And it may have others which I hav=
en't
> > had time to audit.
> >
> Ok. when you get chance to audit, lets discuss that time.

Well, I'm not the author of this series, it should be your job
otherwise it would be too late.

For example, how is the power management interaction with the freeze/stop?

>
> > >
> > > It is not written in this series, because we believe it must not be s=
ynchronized
> > as it is fully controlled by the guest.
> > >
> > > >
> > > > > at the same time such flows must not obstruct
> > > > > +the device migration flow. In such a scenario, a group owner
> > > > > +device can provide the administration command interface to
> > > > > +facilitate the device migration related operations.
> > > > > +
> > > > > +When a virtual machine migrates from one hypervisor to another
> > > > > +hypervisor, these hypervisors are named as source and destinatio=
n
> > > > hypervisor respectively.
> > > > > +In such a scenario, a source hypervisor administers the member
> > > > > +device to suspend the device and preserves the device context.
> > > > > +Subsequently, a destination hypervisor administers the member
> > > > > +device to setup a device context and resumes the member device.
> > > > > +The source hypervisor reads the member device context and the
> > > > > +destination hypervisor writes the member device context. The
> > > > > +method to transfer the member device context from the source to
> > > > > +the destination hypervisor is
> > > > outside the scope of this specification.
> > > > > +
> > > > > +The member device can be in any of the three migration modes. Th=
e
> > > > > +owner driver sets the member device in one of the following mode=
s
> > > > > +during
> > > > device migration flow.
> > > > > +
> > > > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Value & Name &
> > > > > +Description \\ \hline \hline
> > > > > +0x0   & Active &
> > > > > +  It is the default mode after instantiation of the member
> > > > > +device. \\
> > > >
> > > > I don't think we ever define "instantiation" anywhere.
> > > >
> > > Well a transport has implicit definition of the instantiation already=
.
> > > May be a text can be added, but don=E2=80=99t see a value in duplicat=
ing PCI spec
> > here.
> >
> > Ok, maybe something like "transport specific instantiation"
> >
> Ok. that=E2=80=99s a good text. I will change to it.
>
> > >
> > > > > +\hline
> > > > > +0x1   & Stop &
> > > > > + In this mode, the member device does not send any notifications=
,
> > > > > +and it does not access any driver memory.
> > > >
> > > > What's the meaning of "driver memory"?
> > > >
> > > May be guest memory? Or do you suggest a better naming for the memory
> > allocated by the guest driver?
> >
> > Virtqueue?
> >
> Virtqueue and any memory referred by the virtqueue.
>
> This is good text, I will change to it.
>
> > >
> > > > And stop seems to be a source of inflight buffers.
> > > >
> > > I didn=E2=80=99t follow it.
> > > If you mean without stop there are no inflight buffer, then I don=E2=
=80=99t agree.
> > > We don=E2=80=99t want to violate the spec by having descriptors with =
zero size
> > returned.
> > > Stop is not the source of inflight descriptors.
> >
> > I think not since you forbid access to the used ring here. So even if t=
he buffer
> > were processed by the device it can't be added back to the used ring th=
us
> > became inflight ones.
> >
> > >
> > > There are inflight descriptors with the device that are not yet retur=
ned to the
> > driver, and device wont return them as zero size wrong completions.
> > >
> > > > > + The member device may receive driver notifications in this mode=
,
> > > >
> > > > What's the meaning of "receive"? For example if the device can stil=
l
> > > > process buffers, "stop" is not accurate.
> > > >
> > > Receive means, driver can send the notification as PCIe TLP that devi=
ce may
> > receive as incoming PCIe TLP.
> >
> > Ok, so this is the transport level. But the device can keep processing =
the queue?
> >
> Device cannot process the queue because it does not initiate any read/wri=
te towards the virtqueue.

Read/Write only results in a driver noticeable behaviour, it doesn't
mean the device can't process the buffers.  For example, devices can
keep processing available buffers and make them as inflight ones.

>
> > >
> > > In "stop" mode, the device wont process descriptors.
> >
> > If the device won't process descriptors, why still allow it to receive =
notifications?
> Because notification may still arrive and if the device may update any co=
unters as part of

Which counters did you mean here?

> it which needs to be migrated or store the received notification.
>
> > Or does it really matter if the device can receive or not here?
> >
> From device point of view, the device is given the chance to update its d=
evice context as part of notifications or access to it.

This is in conflict with what you said above " Device cannot process
the queue ..."

Maybe you can give a concrete example.

>
> > >
> > > > > + the member device context
> > > >
> > > > I don't think we define "device context" anywhere.
> > > >
> > > It is defined further in the description.
> >
> > Like this?
> >
> > """
> >  +The member device has a device context which the owner driver can  +e=
ither
> > read or write. The member device context consist of any device  +specif=
ic data
> > which is needed by the device to resume its operation  +when the device=
 mode
> > """
> >
> Yes.
> Further patch-3 adds the device context and also add the link to it in th=
e theory of operation section so reader can read more detail about it.
>
> > "Any" is probably too hard for vendors to implement. And in patch 3 I o=
nly see
> > virtio device context. Does this mean we don't need transport
> > (PCI) context at all? If yes, how can it work?
> >
> Right. PCI member device is present at source and destination with its la=
yout, only the virtio device context is transferred.
> Which part cannot work?

It is explained in another thread where you are saying the PCI
requires mediation. I think any author should not ignore such
important assumptions in both the change log and the patch.

And again, the more I review the more I see how narrow this series can be u=
sed:

1) Only works for SR-IOV member device like VF
2) Mediate PCI but not virtio which is tricky
3) Can only work for a specific BAR/capability register layout

Only 1) is described in the change log.

The other important assumptions like 2) and 3) are not documented
anywhere. And this patch never explains why 2) and 3) is needed or why
it can be used for subsystems other than VFIO/Linux.

>
> > >
> > > > >and device configuration space may change. \\
> > > > > +\hline
> > > >
> > > > I still don't get why we need a "stop" state in the middle.
> > > >
> > > All pci devices which belong to a single guest VM are not stopped ato=
mically.
> > > Hence, one device which is in freeze mode, may still receive driver
> > > notifications from other pci device,
> >
> > Device may choose to ignore those notifications, no?
> >
> > > or it may experience a read from the shared memory and get garbage da=
ta.
> >
> > Could you give me an example for this?
> >
> Section 2.10 Shared Memory Regions.

How can it experience a read in this case?

Btw, shared regions are tricky for hardware.

>
> > > And things can break.
> > > Hence the stop mode, ensures that all the devices get enough chance t=
o stop
> > themselves, and later when freezed, to not change anything internally.
> > >
> > > > > +0x2   & Freeze &
> > > > > + In this mode, the member device does not accept any driver
> > > > > +notifications,
> > > >
> > > > This is too vague. Is the device allowed to be freezed in the middl=
e
> > > > of any virtio or PCI operations?
> > > >
> > > > For example, in the middle of feature negotiation etc. It may cause
> > > > implementation specific sub-states which can't be migrated easily.
> > > >
> > > Yes. it is allowed in middle of feature negotiation, for sure.
> > > It is passthrough device, hence hypervisor layer do not get to see su=
b-state.
> > >
> > > Not sure why you comment, why it cannot be migrated easily.
> > > The device context already covers this sub-state.
> >
> > 1) driver writes driver_features
> > 2) driver sets FEAUTRES_OK
> >
> > 3) device receive driver_features
> > 4) device validating driver_features
> > 5) device clears FEATURES_OK
> >
> > 6) driver read stats and realize FEATURES_OK is being cleared
> >
> > Is it valid to be frozen of the above?
> No. device mode is frozen when hypervisor is sure that no more access by =
the guest will be done.

How, you don't trap so 1) and 2) are posted, how can hypervisor know
if there's inflight transactions to any registers?

> What can happen between #2 and #3, is device mode may change to stop.

Why can't be freezed in this case? It's really hard to deduce why it
can't just from your above descriptions.

Even if it had, is it even possible to list all the places where
freezing is prohibited? We don't want to end up with a spec that is
hard to implement or leave the vendor to figure out those tricky
parts.

> And in stop mode, device context would capture #5 or #4, depending where =
is device at that point.
>
> > >
> > > > And what's more, the above state machine seems to be virtio
> > > > specific, but you don't explain the interaction with the device sta=
tus state
> > machine.
> > > First, above is not a state machine.
> >
> > So how do readers know if a state can go to another state and when?
> >
> Not sure what you mean by reader. Can you please explain.

The people who read virtio spec.

>
> > > Second, it is not virtio specific.
> >
> > It's somehow for sure, for example you said device context need to be
> > preserved. And as far as I see the device context is all virtio specifi=
c in patch 3.
> >
> Sure, device context is virtio specific. :)
> Device context will reflect if things changed in the stop mode.
>
> > > It is present in leading OS that has fundamental requirement to suppo=
rt P2P
> > devices.
> >
> > If it's PCI specific, instead of trying to do a workaround in virtio, w=
hy not invent
> > a mechanism there?
> >
> It is not a workaround in virtio.
> It is the way pci p2p devices work for which one needs to be receptive to=
 handle the interaction.
>
>
> > > Third, it is not, interacing with the _actua_ device status.
> > >
> > > In "SUSPEND" patch-5, you already asked this question. I assume you a=
sked
> > again so that this series is complete.
> > >
> > > > For example,
> > > > what happens if the driver wants to reset but the device is in stop
> > > > mode? You told me it is addressed in your series but looks not. Onc=
e
> > > > you try to describe that, you're actually try to connect states bet=
ween the
> > two state machines.
> > > >
> > > As listed in the definition of the stop mode, the device do not act o=
n the
> > incoming writes, it only keep tracks of its internal device context cha=
nge as part
> > of this.
> >
> > So only the driver notification is allowed by not config write? What's =
the
> > consideration for allowing driver notification?
> >
> Because for most practical purposes, peer device wants to queue blk, net =
other requests and not do device configuration.

You forbid the device to process the queue but only allow the
notification. How can the device queue those requests? The device can
just do the available buffer check after resume, then it's all fine.

>
> Do you know any device configuration space which is RW?
> For net and blk I recall it as RO?

For example, WCE. What's more important, the spec allows config space
to be RW, so even if there's no examples before, it doesn't mean we
won't have a RW in the future.

>
> > Let me ask differently, similar to FLR, what happens if the driver want=
s a virtio
> > reset but the hypervisor wants to stop or freeze?
> >
> The device would respond to stop/freeze request when it has internally st=
arted the reset, as device is the single synchronization point which knows =
how to handle both in parallel.

Let's define the synchronization point first. And it demonstrates at
least devices need to synchronize between the free/stop and virtio
device status machine which is not as easy as what is done in this
patch.

>
> > > We would enrich the device context for this, but no need to connects =
the
> > admin mode controlled by the owner device with operational state
> > (device_status) owned by the member device.
> > >
> > > > > + it ignores any device configuration space writes,
> > > >
> > > > How about read and the device configuration changes?
> > > >
> > > As listed, device do not have any changes.
> > > So device configuration change cannot occur.
> >
> > It's not necessarily caused by config write, it could be things like li=
nk status or
> > geometry changes that are initiated from the device.
> >
> I understand it. Link status was one example, you listed other examples t=
oo.
> The point is, when in freeze mode, the member device is frozen, hence, de=
vice won't initiate those changes.
>
> > >
> > > The device requirements cover this content more explicitly:
> > >
> > > For the SR-IOV group type, regardless of the member device mode, all
> > > the PCI transport level registers MUST be always accessible and the
> > > member device MUST function the same way for all the PCI transport le=
vel
> > registers regardless of the member device mode.
> > >
> > > > > + the device do not have any changes in the device context. The
> > > > > + member device is not accessed in the system through the virtio
> > interface.
> > > > > + \\
> > > >
> > > > But accessible via PCI interface?
> > > >
> > > Yes, as usual.
> > >
> > > > For example, what happens if we want to freeze during FLR? Does the
> > > > hypervisor need to wait for the FLR to be completed?
> > > >
> > > Hypervisor do not need wait for the FLR to be completed.
> >
> > So does FLR change device context?
> Yes.

So this implies the freeze needs to wait for FLR otherwise device
context may change.

>
> >
> > >
> > > > > +\hline
> > > > > +\hline
> > > > > +0x03-0xFF   & -    & reserved for future use \\
> > > > > +\hline
> > > > > +\end{tabularx}
> > > > > +
> > > > > +When the owner driver wants to stop the operation of the device,
> > > > > +the owner driver sets the device mode to \field{Stop}. Once the
> > > > > +device is in the \field{Stop} mode, the device does not initiate
> > > > > +any notifications or does not access any driver memory. Since th=
e
> > > > > +member driver may be still active which may send further driver
> > > > > +notifications to the device, the device context may be updated.
> > > > > +When the member driver has stopped accessing the device, the
> > > > > +owner driver sets the device to \field{Freeze} mode indicating t=
o
> > > > > +the device that no more driver access occurs. In the
> > > > > +\field{Freeze} mode, no more changes occur in the device context=
.
> > > > > +At this point, the device ensures that
> > > > there will not be any update to the device context.
> > > >
> > > > What is missed here are:
> > > >
> > > > 1) it is a virtio specific states or not
> > > It is not.
> > >
> > > > 2) if it is a virtio specific state, if or how to synchronize with
> > > > transport specific interfaces and why
> > > > 3) can active go directly to freeze and why
> > > >
> > > Yes. don=E2=80=99t see a reason to not allow it.
> > > Active to freeze mode can change is useful on the destination side, w=
here
> > destination hypervisor knows for sure that there is no other entity acc=
essing the
> > device.
> > > And it needs to setup the device context, it received from the source=
 side.
> > > So setting freeze mode can be done directly.
> > >
> > > > > +
> > > > > +The member device has a device context which the owner driver ca=
n
> > > > > +either read or write. The member device context consist of any
> > > > > +device specific data which is needed by the device to resume its
> > > > > +operation when the device mode
> > > >
> > > > This is too vague. There're states that are not suitable for cmd/qu=
eue for
> > sure.
> > > > I'd split it into
> > > >
> > > > 1) common states: virtqueue, dirty pages
> > > > 2) device specific states: defined be each device
> > > >
> > > This is theory of operation section. So it capturing such details.
> > > Actual device context definition is outside of theory, and precise st=
ates of
> > virtqueue, device specific, etc are in it.
> >
> > See my comment above regarding to the device context.
> >
> I replied above, device context link is added in the patch-3 in the theor=
y of operation.
> So reader gets the complete view.
>
> > >
> > > > > +is changed from \field{Stop} to \field{Active} or from
> > > > > +\field{Freeze} to \field{Active}.
> > > > > +
> > > > > +Once the device context is read, it is cleared from the device.
> > > >
> > > > This is horrible, it means we can't easily
> > > >
> > > > 1) re-try the migration
> > > > 2) recover from migration failure
> > > >
> > > Can you please explain the flow?
> >
> > When migration fails, management can choose to resume the device(VM) on
> > the source.
> >
> ok. This should be possible as the management which has the device contex=
t, it can restore it on the source
> and move the device mode to active.
>
> > If the state were cleared, it means there's not simple way to resume th=
e device
> > but restoring the whole context.
> >
> Yes, as you say, by restoring the whole context will suffice this corner/=
rare case scenario.
>
> > What's the consideration for such clearing?
> >
> There are two considerations.
> 1.  If one does not clear, till how long should it be kept on the device?

Until virtio reset, this is how virtio works now. I've pointed out
that it may cause extra troubles when trying to resume, but you don't
tell me what's wrong to keep that?

> 2. device context returns incremental value from the previous read. So, i=
t needs to clear it.

I don't understand here. This is not the case for most of the devices.

>
> > > And which software stack may find this useful?
> > > Is there any existing software that can utilize it?
> >
> > Libvirt.
> >
> Does libvirt restore on migration failure?

Yes.

>
> > > Why that device context present with the software vanished, in your
> > assumption, if it is?
> > >
> > > > > Typically, on
> > > > > +the source hypervisor, the owner driver reads the device context
> > > > > +once when the device is in \field{Active} or \field{Stop} mode
> > > > > +and later once the member device is in \field{Freeze} mode.
> > > >
> > > > Why need the read while device context could be changed? Or is the
> > > > dirty page part of the device context?
> > > >
> > > It is not part of the dirty page.
> > > It needs to read in the active/stop mode, so that it can be shared wi=
th
> > destination hypervisor, which will pre-setup the complex context of the=
 device,
> > while it is still running on the source side.
> >
> > Is such a method used by any hypervisor?
> Yes. qemu which uses vfio interface uses it.

Ok, such software technology could be used for all types of devices, I
don't see any advantages to mention it here unless it's unique to
virtio.

>
> >
> > >
> > > > > +
> > > > > +Typically, the device context is read and written one time on th=
e
> > > > > +source and the destination hypervisor respectively once the
> > > > > +device is in \field{Freeze} mode. On the destination hypervisor,
> > > > > +after writing the device context, when the device mode set to
> > > > > +\field{Active}, the device uses the most recently set device
> > > > > +context and resumes the device
> > > > operation.
> > > >
> > > > There's no context sequence, so this is obvious. It's the semantic
> > > > of all other existing interfaces.
> > > >
> > > Can you please what which existing interfaces do you mean here?
> >
> > For any common cfg member. E.g queue_addr.
> >
> > The driver wrote 100 different values to queue_addr and the device used=
 the
> > value written last time.
> >
> o.k. I don=E2=80=99t see any problem in stating what is done, which is le=
ss vague. =F0=9F=98=8A
>
> > >
> > > > > +
> > > > > +In an alternative flow, on the source hypervisor the owner drive=
r
> > > > > +may choose to read the device context first time while the devic=
e
> > > > > +is in \field{Active} mode and second time once the device is in
> > > > > +\field{Freeze}
> > > > mode.
> > > >
> > > > Who is going to synchronize the device context with possible
> > > > configuration from the driver?
> > > >
> > > Not sure I understand the question.
> > > If I understand you right, do you mean that, When configuration chang=
e
> > > is done by the guest driver, how does device context change?
> > >
> >
> > Yes.
> >
> > > If so, device context reading will reflect the new configuration.
> >
> > How do you do that? For example:
> >
> > static inline void vp_iowrite64_twopart(u64 val,
> >                                         __le32 __iomem *lo,
> >                                         __le32 __iomem *hi) {
> >         vp_iowrite32((u32)val, lo);
> >         vp_iowrite32(val >> 32, hi);
> > }
> >
> > Is it ok to be freezed in the middle of two vp_iowrite()?
> >
> Yes. the device context VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG section cap=
tures the partial value.

There's no way for the device to know whether or not it's a partial
value or not. No?

>
> > >
> > > > > Similarly, on the
> > > > > +destination hypervisor writes the device context first time whil=
e
> > > > > +the device is still running in \field{Active} mode on the source
> > > > > +hypervisor and writes the device context second time while the
> > > > > +device is in
> > > > \field{Freeze} mode.
> > > > > +This flow may result in very short setup time as the device
> > > > > +context likely have minimal changes from the previously written =
device
> > context.
> > > >
> > > > Is the hypervisor who is in charge of doing the comparison and
> > > > writing only the delta?
> > > >
> > > The spec commands allow to do so. So possibility exists from spec wis=
e.
> >
> > There are various optimizations for migration for sure, I don't think m=
entioning
> > any specific one is good.
> >
> The text is informative text similar to,
>
> " However, some devices benefit from the ability to find out the amount o=
f available data in the queue without
> accessing the virtqueue in memory"
>
> " To help with these optimizations, when VIRTIO_F_NOTIFICATION_DATA has b=
een negotiated".
>
> Is this the only optimization in virtio? No, but we still mention the rat=
ionale of why it exists.

The above is a good example as it explain VIRTIO_F_NOTIFICATION_DATA
is the only way without accessing the virtqueue. But this is not the
case of migration. You said it's just a possibility but not a must
which is not the case for VIRTIO_F_NOTIFICATION_DATA.

Thanks


> As long as the rationale do not confuse the reader, and adds the value ex=
plaining how things work, it is fine to add.
> Which is what above few lines did.
> So let's keep it.
>
> The easiest is to cut out the whole theory of operation and just write co=
mmands like how RSS command did, without even writing a single line about R=
SS.
> I think we can do better explanation than that for new things we add.


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

