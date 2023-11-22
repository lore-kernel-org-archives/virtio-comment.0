Return-Path: <virtio-comment-return-8518-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B8C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:16:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6756C2A8E7
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:16:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 566BA9868A7
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:16:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B936986893; Wed, 22 Nov 2023 04:16:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DE2A986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: WT2Y85qoMC6tBBPrm8HCrw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700626556; x=1701231356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePRJBx2TMRfa+Pe8wuFARqhauK8p+JYaTD/g8WQon8E=;
        b=taFhvKzNY2rUMAiEECTaN2IYQUkB6PLFxHiNOI2BTVngjneJHASf2IuU+ZWiu7l489
         PX12J4/4wb9G20f+CYEs/9pVjEKHcBo1Oq9ztOXDurZQytq92ykFX25JZy8SvwD4uq2z
         ZPJsglqSJvwligSZS5xIl0SWVumDPtFGz9YPiO0z7CWINrj3c957GOkOO9p3Fsvfg5c9
         8j0crvDmOisoyEAYkGEgImXO6mlouFEFr82KSFkUBp+buDd3/ZwLxSyz/dvV6FdlaX/4
         IyMB9+ktYZsdfTpibI5IIY4QLAd8eOOXS3aHZz9enR0VZ52V9JsnI6X0nzzB4ExDxEHS
         /fTQ==
X-Gm-Message-State: AOJu0YxTA/qyK/EZcsqSzQM5HpnQANO2nBJNj+8vbRBFe7yuAi8d3eeL
	l+jTfL/3qTVLGHRX+w7im3cwF41gQrwCNt1vFAMJUHFwdvkU80G3qiJ1AK4iiEZeji4aKAPzwnZ
	kgnjpZQYsWwdTZFv9uvJIdd/M21XnveuxGo+tu7QnoTI3Anw98A==
X-Received: by 2002:ac2:54a4:0:b0:50a:2721:a43d with SMTP id w4-20020ac254a4000000b0050a2721a43dmr735933lfk.49.1700626556494;
        Tue, 21 Nov 2023 20:15:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPaEgJuEvTpiLHYfUOcocF4Zq3+vO1EkR+PnQtMrE/2GHPbdhefmEw9K7IzzfqesdzR8HfD2PxIn/JrdWEFOk=
X-Received: by 2002:ac2:54a4:0:b0:50a:2721:a43d with SMTP id
 w4-20020ac254a4000000b0050a2721a43dmr735931lfk.49.1700626556208; Tue, 21 Nov
 2023 20:15:56 -0800 (PST)
MIME-Version: 1.0
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com> <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com> <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com> <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <5bdc33bb-4ad5-4274-9764-69e1887b0d17@intel.com> <PH0PR12MB54815431B823C54E3231EC5EDCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bb66298e-9ee5-4370-8532-13110f392f41@intel.com> <PH0PR12MB548189E49C97E91374B3F514DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4201d1df-100d-495c-97ba-7efbe73d9137@intel.com> <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com> <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com> <PH0PR12MB5481501A7771A21583B905B1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvNoLny_VPaQ5Ooob3cEystgdc6xi24G5wScT5FUdVz_Q@mail.gmail.com> <PH0PR12MB54815513853CC3299D2DBC7EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54815513853CC3299D2DBC7EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 12:15:44 +0800
Message-ID: <CACGkMEtBbDS91gKf1pGiWNBLXatS0PjPJDEU4JtC6=uAjrOBzA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "mst@redhat.com" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Wed, Nov 22, 2023 at 12:26=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 10:01 AM
> >
> > On Fri, Nov 17, 2023 at 6:06=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >

[...]

> > > Sorry, no virtio specification does not support device migration toda=
y.
> > > Nothing is broken by adding new features.
> > >
> > > Above [1] has the right proposal that Jason's paper pointed out. Plea=
se use
> > it.
> >
> > I was involved in the design in [1]. And I don't see a connection to th=
e
> > dicussion here
> >
> > 1) It is based on vDPA in L0
> > 2) It doesn't address the nesting issue, it requires a proper design in=
 the virtio
> > spec to support migration in the nesting layer.
>
> Nothing prevents [1] to be done without vdpa.

Well, Qemu has SR-IOV emulation for IGB. What's the point of the above
reply? If a hypervisor wishes, it can be done with any device on L0.

We discuss the possibility of migrating nested VMs, not the
possibility of emulating SR-IOV, no?

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

