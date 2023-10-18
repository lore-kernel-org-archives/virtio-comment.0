Return-Path: <virtio-comment-return-7773-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941D9CDB474
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:54:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0260D774EC
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:54:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E87BB98688E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 00:54:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE38D983C26; Wed, 18 Oct 2023 00:54:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D094B986885
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 00:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: U0UqWLz0PBeExu04M5rXhw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590435; x=1698195235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/MGDqwyKItN6vQzG7Pr+C9+lhY+61ChIWjY7EEevX8=;
        b=t2jcbwLlEXVfyEO0PshB5T57DlYNC2SSbkggfCInnq51MrwgEQMp3GusLDDde0gSRw
         Z5dImPnLfLX2zJJ+Fa67O7DrKDwcuxhS+BaTrgwJ0BjicwQZaMQhUcSi2H9rWRzZmLVG
         NK1rAVrwnwR+XQALwvJ+z30uQ48ooXBLBiDOD3RHCRKQIcEBabgRHsz2n3+cM1DUgkHt
         dUHVMjnnkJPb1HoGiisoQVE+XaW6+sIL2U/zPTfTLIo0Qu9u28XfmQJihkYn6RW8ybwP
         l9jr+I1CiuTOOfxJnfwPmjMCQ8JuWT9Nr/FzWraO+wzOGM4yVmhXZ3t0ExDYcryWBJvM
         jC4A==
X-Gm-Message-State: AOJu0YypaKrllsnQT1bY71+qutHTYqIIK4tK72a2lPr2QeIuvAB1AaB/
	mACi0BsTw0ECcfR98xRl8KYduZ+d8fZbccxgZBIef8TWKvt9Cb8e+rU120nrWM7y3a0sh0unI9b
	r43EVSLW9o3gTsM7pT4jdN6lYmoWPLsB6qdzeecnuqXgcMIDj/Q==
X-Received: by 2002:a19:a411:0:b0:4fb:911b:4e19 with SMTP id q17-20020a19a411000000b004fb911b4e19mr2855393lfc.35.1697590435122;
        Tue, 17 Oct 2023 17:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRXbc8AqDK7Ntd7DMd/GJU2vO38Hg3UTyhvYywR/1Zygt897rgqvy5kmek0//mkTBRHfGYt7DZ0vf1aN82yE=
X-Received: by 2002:a19:a411:0:b0:4fb:911b:4e19 with SMTP id
 q17-20020a19a411000000b004fb911b4e19mr2855386lfc.35.1697590434767; Tue, 17
 Oct 2023 17:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231017200645.779222-1-parav@nvidia.com>
In-Reply-To: <20231017200645.779222-1-parav@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Oct 2023 08:53:43 +0800
Message-ID: <CACGkMEtr7HWPQ+LRX1pR9EVq7Pe13OVjbQbdrGshZBsh_Rv_2A@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, cohuck@redhat.com, 
	sburla@marvell.com, shahafs@nvidia.com, maorg@nvidia.com, yishaih@nvidia.com, 
	lingshan.zhu@intel.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands

On Wed, Oct 18, 2023 at 4:07=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
> This series introduces administration commands for member device migratio=
n
> for PCI transport; when needed it can be extended for other transports
> too.
>
> Use case requirements:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. A hypervisor system needs to provide a PCI VF as passthrough
>    device to the guest virtual machine and also support live
>    migration of this virtual machine.
>    A passthrough device has typically only PCI configuration space
>    and MSI-X table emulated. No virtio native interface offered
>    by the virtio member device is trapped and/or emulated.
> 2. A virtual machine may have one or more such passthrough
>    virtio devices.
> 3. A virtual machine may have other PCI passthrough device
>    which may also interact with virtio device.
> 4. A hypervisor runs a generic device type agnostic driver with
>    extension to support device migration.
> 5. A PCI VF passthrough device needs to support transparent
>    device reset and PCI FLR while the device migration is
>    ongoing.
> 6. A owner driver do not involve in device operations mediation
>    for the passthrough device at virtio interface level.
> 7. Mechanism is generic enough that applies to large family of
>    virtio devices and it does not involve trapping any virtio
>    device interfaces for the passthrough devices.
>
> Overview:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Above usecase requirements is solved by PCI PF group owner driver
> facilitating the member device migration functionality using
> administration commands.
>
> There are three major functionalities.
>
> 1. Suspend and resume the device operation
> 2. Read and Write the device context containing all the information
>    that can be transferred from source to destination to migrate to
>    a member device
> 3. Track pages written by the device during device migration is
>    ongoing
>
> This comprehensive series introduces 4 infrastructure pieces
> covering PCI transport, peer to peer PCI devices, page write tracking
> (aka dirty page tracking) and generic virtio device context.
>
> 1. Device mode get,set (active, stop, freeze)
> 2. Device context read and write
> 3. Defines device context and compatibility command
> 4. Write reporting to track page addresses
>
> This series enables virtio PCI SR-IOV member device to member device
> migration. It can also be used to/from migrate from PCI SR-IOV member
> device to software composed PCI device if/when needed which can
> parse and compose software based PCI virtio device.
>
> Example flow:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Source hypervisor:
> 1. Instructs device to start tracking pages it is writing
> 2. Periodically query the addresses of the written pages
> 3. Suspend the device operation
> 4. Read the device context and transfer to destination hypervisor
>
> Destination hypervisor:
> 5. Write the device context received from source
> 6. Resume the device that has newly written device context
>
> Patch summary:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> patch-1: Adds theory of operation for device migration commands
> patch-2: Redefine reserved2 to command output field
> patch-3: Defines short device context for split virtqueues
> patch-4: Adds device migration commands
> patch-5: Adds requirements for device migration commands
> patch-6: Adds theory of operation for write reporting commands
> patch-7: Adds write reporting commands
> patch-8: Adds requirements for write reporting commands
>
> It also takes inspiration from the similar idea presented at KVM Forum
> at [1].
>
> Please review.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v1->v2:
> - Addressed comments from Michael and Jason
> - replaced iova to page/physical address range in write recording command=
s
> - several device specific requirements added to clarify, interaction of
>   device reset, FLR, PCI PM and admin commands
> - added device context fields query command to learn compatibility
> - split device context field type range into generic and device specific
> - added device context extension section to maintain backward and future
>   compatibility
> - several rewording in theory of operation
> - added requirements to cover config space read/write interaction with
>   device context commands
> - added assumption about pci config space and msix table not present in
>   device context, which can be added when hypervisor need them
> v0->v1:
> - enrich device context to cover device configuration layout, feature bit=
s
> - fixed alignment of device context fields
> - added missing Sign-off for the joint work done with Satananda
> - added link to the github issue

A lot of questions were not answered in V1, do you expect me to repeat
it again here?

Thanks


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

