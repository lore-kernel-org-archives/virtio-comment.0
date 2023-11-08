Return-Path: <virtio-comment-return-8255-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43CC4167D
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:29:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A7962AD55
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:29:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3094D986C9B
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:29:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24F0E986C8F; Wed,  8 Nov 2023 04:29:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17EC7986C90
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 04:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6BvpaeDbMraWogeoLZD_Ag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699417738; x=1700022538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYm9OVVIh3y0zdtzrOixb1MZ/PVrN2jXFdvPhdFyJiQ=;
        b=tob1cy19yXFvUB9gLEn4qmbRMYTj6qmL/OUDkDtDGm4xqlHEQW8THhYuOiIPJjb37G
         Nvy0O8Zk+HmrnMIxRmWG6FnWBvWP9w25BI7bdDJOdtzlZQ1SR99k5igZOi0PqjEGMBE6
         cOIkyXp21jg/w4jwKMCSzFhiHYFA66SaDcWPGULbFwSWGS50R+W9R5tlwyZWQ5tPZFfy
         wRt1H1Hc37KNXJJTHuyc6RRapIQmxs4S367R3sLJ25rJ6S4BHoWJ3kxBvE23u3Zw4h2F
         lsNJRlcUssCpqWmLjgaDZluhFYfDiSbCc86iy5Yyigd2Rb1Cs/p4Ctq+LuOqZ4Axo24g
         yCow==
X-Gm-Message-State: AOJu0YydoKBBqPIh0bcsX3jYqQEcLCv4+aIyY3UmCUweh/lQrRJcrffS
	Wc+fNorhp/Mri06M/ynYtbOSUry06tcfYrKIUOpdzdBI3KdZL6SmHBh9wYkr8Kta6aLlTB+FgdC
	8J/uyKrAnGdJ8hw5H9WEn3p1ciMrVMHQHSoNneGKcy+kMCBCClg==
X-Received: by 2002:ac2:5a45:0:b0:509:47ba:3160 with SMTP id r5-20020ac25a45000000b0050947ba3160mr376379lfn.56.1699417738505;
        Tue, 07 Nov 2023 20:28:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoOtuVPHofgt7rCUcw6tQEAp+6MfRcHE668hRlrhs3UgHp7sojMI9tgmRlkbhu4JKVyOsXk2xDNUFk6NxSSNE=
X-Received: by 2002:ac2:5a45:0:b0:509:47ba:3160 with SMTP id
 r5-20020ac25a45000000b0050947ba3160mr376368lfn.56.1699417738188; Tue, 07 Nov
 2023 20:28:58 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
 <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com> <20231107021917-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231107021917-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Nov 2023 12:28:47 +0800
Message-ID: <CACGkMEtZu_xXofM3tKS6JYyR+DCjw+UdEAGb_q-Sf4q4RWLMAg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Nov 7, 2023 at 3:22=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Nov 07, 2023 at 12:05:12PM +0800, Jason Wang wrote:
> > > > > > One thing that you ignore is that, hypervisor can use what you
> > > > > > invented as a transport for VF, no?
> > > > > >
> > > > > No. by design,
> > > >
> > > > It works like hypervisor traps the virito config and forwards it to=
 admin
> > > > virtqueue and starts the device via device context.
> > > It needs more granular support than the management framework of devic=
e context.
> >
> > It doesn't otherwise it is a design defect as you can't recover the
> > device context in the destination.
> >
> > Let me give you an example:
> >
> > 1) in the case of live migration, dst receive migration byte flows and
> > convert them into device context
> > 2) in the case of transporting, hypervisor traps virtio config and
> > convert them into the device context
> >
> > I don't see anything different in this case. Or can you give me an exam=
ple?
>
> "trap virtio config" means "trap writes into virtio config" presumably?

It means trap as current Qemu did.

> config can change itself without driver doing anything. Hypervisor
> can't trap it then.

I don't understand here, the hypervisor can see the config interrupt.
This is how Qemu works now?

> This is one of the problems with Lingshan's
> SUSPEND bit - what happens with these config changes in underspecified.

I don't see a direct relationship with SUSPEND bit here. I meant this
proposal can be used for the hypervisor to trap and emulate config.

Thanks


>
> --
> MST
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

