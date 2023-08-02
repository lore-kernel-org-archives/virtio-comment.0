Return-Path: <virtio-comment-return-6955-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696F0C00528
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:53:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A85292AD42
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:53:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A30B598664C
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 08:53:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99EAF9865F7; Wed,  2 Aug 2023 08:53:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8869C986602
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 08:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: IXqpHEvOPz-fY4GQajAhkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966394; x=1691571194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgMAxkv14gFUtCBVVFlPgtkb9MfWgCQirImAeFHJaO0=;
        b=Iaq+Jq7Ilv70cVgRWmknydJF5ZKz3AHhm8aflVFd1Gfdu2Nt8XkO30iWik/EEIf9aV
         vTvZXaiRm9MTVBTsFrgiYlQIPksNveiSXdJClNC+d6ycxhFZyZBpCjavpRoBaXmPkHwR
         zkRPQ2qfUL9j1okbp9tqNq8L8gh1OANJUnu+YfeP6mRXOD84jaC1v/XU/dZqDMR4ThSX
         rVWT/vqIz8h2vzCFysKWhKd+v/ZewCpEu83hprZb9bo/+bnsfB4NokyJfp3X1EaHFjRk
         Il+u1Z7PNlE2+Ndar61HEmGXb9Did8tCwa1+uXXb0F6fEmmTIAPpi+I9Glil2Dq7zpwV
         xF3Q==
X-Gm-Message-State: ABy/qLYPI/buZAvcnaS9avuIMJgiCDwY39ZOguKg18g1fCxba/K0rttA
	39vNNJPUul3tItFonJAOWsQFFXWAj8939DU9+h+6j/hN4/mVowr62nSo5PyVMxq68xe+o6d7wU8
	J/6QN01saDykdi+K3Nsj+ss3cEEpqY+Aw1RTReR5Esp4aUZGAMw==
X-Received: by 2002:a2e:920b:0:b0:2b6:af60:6342 with SMTP id k11-20020a2e920b000000b002b6af606342mr4356990ljg.40.1690966394754;
        Wed, 02 Aug 2023 01:53:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXwdAkrCKjU1svfqLn5Fxa9ivLiZ161EMLnyVSh0sO1A1Mvaxx+Rb5ayKUCQ7HxikVXQATAxFBef57cuuLZnA=
X-Received: by 2002:a2e:920b:0:b0:2b6:af60:6342 with SMTP id
 k11-20020a2e920b000000b002b6af606342mr4356980ljg.40.1690966394406; Wed, 02
 Aug 2023 01:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 2 Aug 2023 16:53:03 +0800
Message-ID: <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] proposal: use admin command (and aq) of the
 device to query config space

On Tue, Aug 1, 2023 at 3:09=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> One line proposal:
> Let's use new admin command and admin q for all device types to query dev=
ice config space for new fields. (always).

Before we mandate anything to admin command, we need to first invent
an admin command over MMIO interface otherwise it would always be an
issue for the nesting.

>
> Details below.
>
> Query of device capabilities and configuration using DMA interface.
> Need:
> Currently device configuration space is exposed as read only registers.

This is wrong:

1) device configuration space is transport independent, some transport
already use DMA to access the device configuration space
2) device configuration space is not read only, we've already had
several examples of using it as write

> It is growing rapidly.
> Some devices may be even multi-functionality device in coming future such=
 as net + clock + rdma device.
> For a PCI transport implementing such ever-growing capabilities, configur=
ation is burdensome as plain registers.

We've already fixed size VIRTIO_PCI_CAP_PCI_CFG. What's wrong with that?

And we have a lot of device specific virtqueues that could be used for
configuration.

> Hence, it is required for the driver to query capabilities and configurat=
ion using a DMA interface.
>
> Interface requirements:
> 1. Maintain backward compatibility for existing defined configuration fie=
lds to stay as registers.
> 2. Any new field added must be accessed via DMA interface, regardless of =
device implementation (hw/sw etc).
> Results in single driver code regardless of device implementation.

Virtio is flexible as it decouples transport from the device model.
This breaks this flexibility, and this prevents non-DMA transport from
being developed.

> 3. A device must be able to choose, starting from which field driver must=
 query
> such configuration via DMA interface. This field offset must be greater t=
han currently defined configuration field.
> 4. Any driver to device query operation must not be mandated to be
> mediated by the owner device for PCI VFs or SIOV or SF devices. Driver mu=
st be able to
> communicate query capabilities and configuration fields directly to
> the device regardless of device type being PCI PF, VF, SF/SIOV device uni=
formly.
> 5. When having multi-functionality device in future, it is desired to not=
 always
> query all the configuration but may be able to query per-functionality co=
nfigurations.
> For example, query only steering capabilities, query only rdma capabiliti=
es or query only clock capabilities.
> 6. The driver should be able to query config/capabilities without
> polling for the DMA completion, in other words, the driver should be able=
 to get
> notification from the device when DMA command completes.
> 7. The driver should be able to utilize existing interrupt vector and/or
> virtqueue for query and set operation without demanding
> additional interrupt vector whenever possible.
>
> There are multiple options for DMA interface.
> Some of these options are listed below that we would like to consider ful=
filling above requirements.
>
> Option_1:
> New DMA interface registers.
> New registers which allows single outstanding DMA command per device.
> Such as,
> struct pci_dma_cmd_mmio_registers {
>         le64 cmd_addr; /* rw */
>         le32 cmd_len;   /* rw: ordered write to it after cmd_addr, this t=
riggers cmd to device */
>         le32 start_offset_cfg_space; /* fields below this offset are not =
available as register, dma is must */
> };
>
> struct pci_config_access_cmd {
>         u8 opcode; /* 0 =3D get config, 1 to N set dev specific config */
>         u8 reserved;
>         le16 msix_vector_index;
>         le64 rsp_addr; /* points to struct pci_config_access_rsp */
>         le32 rsp_len;
> };
> struct pci_config_access_rsp {
>         u8 status;
>         u8 debug_field;
>         u8 cmd_specific_data[];
> };
>
> Cons:
> 1. Duplication of a VQ interface which can do same work and vq is purpose=
d for "bulk data transfer" in spec already like this use case.
> 2. Some devices already have CVQ that can easily fulfil this role, which =
is not utilized.
> 3. Requires per device additional 16 bytes of register space.
> 4. Requires an extra msix interrupt vector to differentiate from config c=
hange interrupts.
>
> Option_2:
> Use admin vq for all the device types regardless of its transport such as=
 PCI PF, PCI VF, PCI SIOV.
> In this method a new admin command is issued on the admin vq of the devic=
e itself.
> Pros:
> 1. Requirements 1 to 7 are fulfilled.
> 2. Driver can reuse the same vector with CVQ that addresses requirement #=
7.
> Cons:
> 1. Requires per device unique admin queue number and count.
> Still better than dedicated dma interface of #1, as it requires only 4 ad=
ditional bytes as opposed to 12 bytes.
>
> Option_3:
> Use control VQ for the devices that already has CVQ.
> In this method an existing CVQ of the device is used to query device conf=
ig space.
> Pros:
> 1. All 7 requirements are fulfilled.
> 2. Does not need 4 bytes of admin queue registers.
> 3. Save MSI-X vectors of the AQ.
> 4. Superior to option_2 as it doesn't require extra AQ.
> 5. Most efficient of all 3 options.
> Cons:
> 1. Those devices which does not have CVQ, may need to add it if at all th=
ey are growing.
>
> d. Any other option?

Transport virtqueue on top of admin virtqueue will address this seamlessly.

Thanks


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

