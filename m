Return-Path: <virtio-comment-return-7624-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5531DE95A8E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 08:50:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 05E4868480
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 08:50:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36D0B98686E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 08:50:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3DB019864F3; Mon,  9 Oct 2023 08:50:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D72819864D3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 08:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: p-88XK25PryFst6taZZINA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841357; x=1697446157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp14cPAOhoDyaNxXP7qYn6/I4El0YO6UIw5nyD2lL80=;
        b=KfL4B88APgZXqwm8FRd+fo6AaOKT894F5o5WZTfGb4RVGeb5sb+dVvvUCJQ+OKa6Yz
         lnGlgmYhhe4PCWDxXEUlpKH2m0nFy9tY+ZQ49apjONM5yNzndNdKOsMoE3gNXqkCe1Bk
         7j64Ul5n+SltIBKFwn0PK81r3aRJxeCIVLaiv9GBl/UtSNkDza7ovye93sXqijzeRgy5
         6EbYdbLPmJSF91m5XDOr057OtFbBC+KkJKrFObT2kkVACFNI16ojeXs+yCuIpBjLY/JN
         LlI7HMHSc04i8BXOsyKSS3BTQRwJnyKRBzi7oJH23M8P9auXacIUNn5NoLPM7eT7dJxK
         Ou3A==
X-Gm-Message-State: AOJu0YxZoYxg8GSiZsKV+Yyoa0Wz3E3jX8i2zj0ZjsRjLxTfE5eH9TP0
	2Px+KDP/BM0B4xQi60mjIFgFkUd/KokEBPBOEaTN5lSwSUGU/ykDutmXnQseRn98UXitE08uRkI
	r7ycLLcFKLmKpoSNomlyEx2ubxt9gSshDJq2VEpabVHf+fUHesg==
X-Received: by 2002:a05:6512:2030:b0:503:258f:fd15 with SMTP id s16-20020a056512203000b00503258ffd15mr10472164lfs.20.1696841357575;
        Mon, 09 Oct 2023 01:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPjQzPyedKbPuWT9kYPS4M6eGwe0yOaS0Jxi1BH03GjQ0vZENaqIF+HbmsG73Koj6Z0sO/RAnDyB7pWNBYCXs=
X-Received: by 2002:a05:6512:2030:b0:503:258f:fd15 with SMTP id
 s16-20020a056512203000b00503258ffd15mr10472150lfs.20.1696841357145; Mon, 09
 Oct 2023 01:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
In-Reply-To: <20231008112555.473895-2-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Oct 2023 16:49:06 +0800
Message-ID: <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com, yishaih@nvidia.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

Adding LingShan.

Parav, if you want any specific people to comment, please do cc them.

On Sun, Oct 8, 2023 at 7:26=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> One or more passthrough PCI VF devices are ubiquitous for virtual
> machines usage using generic kernel framework such as vfio [1].

Mentioning a specific subsystem in a specific OS may mislead the user
to think it can only work in that setup. Let's not do that, virtio is
not only used for Linux and VFIO.

>
> A passthrough PCI VF device is fully owned by the virtual machine
> device driver.

Is this true? Even VFIO needs to mediate PCI stuff. Or how do you
define "passthrough" here?

> This passthrough device controls its own device
> reset flow, basic functionality as PCI VF function level reset

How about other PCI stuff? Or Why is FLR special?

> and rest of the virtio device functionality such as control vq,

What do you mean by "rest of"? Which part is not controlled and why?

> config space access, data path descriptors handling.
>
> Additionally, VM live migration using a precopy method is also widely use=
d.

Why is this mentioned here?

>
> To support a VM live migration for such passthrough virtio devices,
> the owner PCI PF device administers the device migration flow.

Well, if this is specific only to PCI SR-IOV, I'd move it to the PCI
transport part. But I guess not.

>
> This patch introduces the basic theory of operation which describes the f=
low
> and supporting administration commands.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/include/uapi/linux/vfio.h?h=3Dv6.1.47
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  admin-cmds-device-migration.tex | 94 +++++++++++++++++++++++++++++++++
>  admin.tex                       |  1 +
>  2 files changed, 95 insertions(+)
>  create mode 100644 admin-cmds-device-migration.tex
>
> diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migratio=
n.tex
> new file mode 100644
> index 0000000..f839af4
> --- /dev/null
> +++ b/admin-cmds-device-migration.tex
> @@ -0,0 +1,94 @@
> +\subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio =
Device / Device groups / Group
> +administration commands / Device Migration}
> +
> +In some systems, there is a need to migrate a running virtual machine
> +from one to another system. A running virtual machine has one or more
> +passthrough virtio member devices attached to it. A passthrough device
> +is entirely operated by the guest virtual machine. For example, with
> +the SR-IOV group type, group member (VF) may undergo virtio device
> +initialization and reset flow

What do you mean by "reset flow"? It looks not like a terminology
defined in the PCI spec. And Google gives me nothing about this.

> and may also undergo PCI function level
> +reset(FLR) flow.

Why is only FLR special here? I've asked FRS but you ignore the question.

> Such flows must comply to the PCI standard and also
> +virtio specification;

This seems unnecessary and obvious as it applies to all other PCI and
virtio functionality.

What's more, for the things that need to be synchronized, I don't see
any descriptions in this patch. And if it doesn't need, why?

> at the same time such flows must not obstruct
> +the device migration flow. In such a scenario, a group owner device
> +can provide the administration command interface to facilitate the devic=
e
> +migration related operations.
> +
> +When a virtual machine migrates from one hypervisor to another hyperviso=
r,
> +these hypervisors are named as source and destination hypervisor respect=
ively.
> +In such a scenario, a source hypervisor administers the
> +member device to suspend the device and preserves the device context.
> +Subsequently, a destination hypervisor administers the member device to
> +setup a device context and resumes the member device. The source hypervi=
sor
> +reads the member device context and the destination hypervisor writes th=
e member
> +device context. The method to transfer the member device context from th=
e source
> +to the destination hypervisor is outside the scope of this specification=
.
> +
> +The member device can be in any of the three migration modes. The owner =
driver
> +sets the member device in one of the following modes during device migra=
tion flow.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +Value & Name & Description \\
> +\hline \hline
> +0x0   & Active &
> +  It is the default mode after instantiation of the member device. \\

I don't think we ever define "instantiation" anywhere.

> +\hline
> +0x1   & Stop &
> + In this mode, the member device does not send any notifications,
> + and it does not access any driver memory.

What's the meaning of "driver memory"?

And stop seems to be a source of inflight buffers.

> + The member device may receive driver notifications in this mode,

What's the meaning of "receive"? For example if the device can still
process buffers, "stop" is not accurate.

> + the member device context

I don't think we define "device context" anywhere.

>and device configuration space may change. \\
> +\hline

I still don't get why we need a "stop" state in the middle.

> +0x2   & Freeze &
> + In this mode, the member device does not accept any driver notification=
s,

This is too vague. Is the device allowed to be freezed in the middle
of any virtio or PCI operations?

For example, in the middle of feature negotiation etc. It may cause
implementation specific sub-states which can't be migrated easily.

And what's more, the above state machine seems to be virtio specific,
but you don't explain the interaction with the device status state
machine. For example, what happens if the driver wants to reset but
the device is in stop mode? You told me it is addressed in your series
but looks not. Once you try to describe that, you're actually try to
connect states between the two state machines.

> + it ignores any device configuration space writes,

How about read and the device configuration changes?

> + the device do not have any changes in the device context. The
> + member device is not accessed in the system through the virtio interfac=
e. \\

But accessible via PCI interface?

For example, what happens if we want to freeze during FLR? Does the
hypervisor need to wait for the FLR to be completed?

> +\hline
> +\hline
> +0x03-0xFF   & -    & reserved for future use \\
> +\hline
> +\end{tabularx}
> +
> +When the owner driver wants to stop the operation of the
> +device, the owner driver sets the device mode to \field{Stop}. Once the
> +device is in the \field{Stop} mode, the device does not initiate any not=
ifications
> +or does not access any driver memory. Since the member driver may be sti=
ll
> +active which may send further driver notifications to the device, the de=
vice
> +context may be updated. When the member driver has stopped accessing the
> +device, the owner driver sets the device to \field{Freeze} mode indicati=
ng
> +to the device that no more driver access occurs. In the \field{Freeze} m=
ode,
> +no more changes occur in the device context. At this point, the device e=
nsures
> +that there will not be any update to the device context.

What is missed here are:

1) it is a virtio specific states or not
2) if it is a virtio specific state, if or how to synchronize with
transport specific interfaces and why
3) can active go directly to freeze and why

> +
> +The member device has a device context which the owner driver can either
> +read or write. The member device context consist of any device specific
> +data which is needed by the device to resume its operation when the devi=
ce mode

This is too vague. There're states that are not suitable for cmd/queue
for sure. I'd split it into

1) common states: virtqueue, dirty pages
2) device specific states: defined be each device

> +is changed from \field{Stop} to \field{Active} or from \field{Freeze}
> +to \field{Active}.
> +
> +Once the device context is read, it is cleared from the device.

This is horrible, it means we can't easily

1) re-try the migration
2) recover from migration failure

> Typically, on
> +the source hypervisor, the owner driver reads the device context once wh=
en
> +the device is in \field{Active} or \field{Stop} mode and later once the =
member
> +device is in \field{Freeze} mode.

Why need the read while device context could be changed? Or is the
dirty page part of the device context?

> +
> +Typically, the device context is read and written one time on the source=
 and
> +the destination hypervisor respectively once the device is in \field{Fre=
eze}
> +mode. On the destination hypervisor, after writing the device context,
> +when the device mode set to \field{Active}, the device uses the most rec=
ently
> +set device context and resumes the device operation.

There's no context sequence, so this is obvious. It's the semantic of
all other existing interfaces.

> +
> +In an alternative flow, on the source hypervisor the owner driver may ch=
oose
> +to read the device context first time while the device is in \field{Acti=
ve} mode
> +and second time once the device is in \field{Freeze} mode.

Who is going to synchronize the device context with possible
configuration from the driver?

> Similarly, on the
> +destination hypervisor writes the device context first time while the de=
vice
> +is still running in \field{Active} mode on the source hypervisor and wri=
tes
> +the device context second time while the device is in \field{Freeze} mod=
e.
> +This flow may result in very short setup time as the device context like=
ly
> +have minimal changes from the previously written device context.

Is the hypervisor who is in charge of doing the comparison and writing
only the delta?

> This flow may
> +reduce the device migration time significantly and may have near constan=
t
> +device activation time regardless of number of virtqueues, resources and
> +passthough devices in use by the migrating virtual machine.

Thanks



> +
> +The owner driver can discard any partially read or written device contex=
t when
> +any of the device migration flow should be aborted.
> diff --git a/admin.tex b/admin.tex
> index 0803c26..6eeef58 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -297,6 +297,7 @@ \subsection{Group administration commands}\label{sec:=
Basic Facilities of a Virti
>  might differ between different group types.
>
>  \input{admin-cmds-legacy-interface.tex}
> +\input{admin-cmds-device-migration.tex}
>
>  \devicenormative{\subsubsection}{Group administration commands}{Basic Fa=
cilities of a Virtio Device / Device groups / Group administration commands=
}
>
> --
> 2.34.1
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

