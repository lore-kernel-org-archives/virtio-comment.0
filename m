Return-Path: <virtio-comment-return-5927-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2226C77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 03:43:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B86CC2A820
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 03:43:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 73EFE9865B6
	for <virtio-comment@archiver.kernel.org>; Tue, 16 May 2023 03:43:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 67F68986512; Tue, 16 May 2023 03:43:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5447F986514
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 May 2023 03:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: y8m9mNBzPgWDqty7vTdmnw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684208601; x=1686800601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFtEmpHHyFqIczufRsyvhP4JPgzdSWld8ykLyEHmwUM=;
        b=a7Ia5uGjWuNCY9JKa6ue6byhZWrueaXseJSW5dl0EneDUxubKysVlXx1tUy1k+IzIJ
         mvKTMglR6pHPYS+6ESN9RttfBq0ZvDerXk6KpOlm5GJb2o5RXdWRr47RC2VcnY7uLpMv
         QUaGNxJAp6uDJ7gf/QIL6ahD/mHv59NxhXI0CUJSvuJnmzpmt/b7E3gL0zZFCRAk7n4B
         J0iyBkk0jJVbab1qFdmgES2XLsfYxiqwHB0fh5AJ2o57B0Z6wtPu5iCMGZVRdms2SPft
         8qZMTAxBMBSkJlkBMYgXolLvcCYvVlH9ppKYYCIPaT1p7QRkYwZFfz3GEV38KgwcVTYC
         fDdQ==
X-Gm-Message-State: AC+VfDy8VugmOapeW+xDdp4Q/KJrJwmixal6PQW6vhkJaS/6CYb0ATX+
	564SnyZXyolZP4SPXuQuybbeptOWSpSeQnhVnZBF2rZUJsrB65uzvByLeeJ8lurqsSHqNRAtInC
	/z1mjBv3EsFtsNAfFqUT8wSUKONJrxgmTebwAZr22r4d375qKdQ==
X-Received: by 2002:a05:6512:208:b0:4ec:9ef9:e3d with SMTP id a8-20020a056512020800b004ec9ef90e3dmr6505196lfo.26.1684208601348;
        Mon, 15 May 2023 20:43:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BZZ+xkQz5IzSA+9OnjQtRl740UPrPdr8ge1IoUe8efZVn9AMZ6no2p1oh7i2vm2sk8G/SX4n9IJaFGJFIOl0=
X-Received: by 2002:a05:6512:208:b0:4ec:9ef9:e3d with SMTP id
 a8-20020a056512020800b004ec9ef90e3dmr6505189lfo.26.1684208601066; Mon, 15 May
 2023 20:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtm5AS50YmPi6A5=gzZZ9Jm55NEJ3GKOTzv-Z0m5E5J_w@mail.gmail.com>
 <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <893b6ec0-a74f-69b7-95a3-988f0f9382a8@redhat.com> <PH0PR12MB5481CF52380D414AFFBA6A9FDC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230515133719-mutt-send-email-mst@kernel.org> <PH0PR12MB54810DE3ECAE95689F80C596DC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230515135513-mutt-send-email-mst@kernel.org> <PH0PR12MB5481923CB4F23968C39F14D8DC789@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230515140052-mutt-send-email-mst@kernel.org> <78ade48a-6f5d-8a2d-1524-44340f0154ce@redhat.com>
In-Reply-To: <78ade48a-6f5d-8a2d-1524-44340f0154ce@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 16 May 2023 11:43:09 +0800
Message-ID: <CACGkMEteeW0yxcguiZ2zBVzmqt12pVRZwofJwVJFo7=FBdyx5A@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Tue, May 16, 2023 at 11:37=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
>
> =E5=9C=A8 2023/5/16 02:01, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > On Mon, May 15, 2023 at 06:00:02PM +0000, Parav Pandit wrote:
> >>> From: Michael S. Tsirkin <mst@redhat.com>
> >>> Sent: Monday, May 15, 2023 1:56 PM
> >>>
> >>> On Mon, May 15, 2023 at 05:51:05PM +0000, Parav Pandit wrote:
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: Monday, May 15, 2023 1:45 PM
> >>>>>
> >>>>> On Mon, May 15, 2023 at 03:49:44PM +0000, Parav Pandit wrote:
> >>>>>> All legacy interface via AQ.
> >>>>>> All modern interface access via PCI or its own transport between
> >>>>>> driver and
> >>>>> device.
> >>>>>
> >>>>> I am wondering however about the hypervisor notifications.
> >>>>> Generally these are the most problematic aspect here I feel.  For
> >>>>> example, how does it interact with VIRTIO_F_NOTIF_CONFIG_DATA?  And
> >>>>> generally, having both guest and host be allowed to access device's=
 BAR
> >>> seems problematic.
> >>>>> Can we reserve a PF BAR region for these things or is that too expe=
nsive?
> >>>> VIRTIO_F_NOTIF_CONFIG_DATA is not present for the legacy.
> >>> it is not but it just might be required, or it won't be there.
> >>>
> >> How can it be required if it not part of it?
> >> I likely didn't follow your question/comment, can you please explain.
> > VIRTIO_F_NOTIF_CONFIG_DATA is there presumably for a reason.
> >
> >>>> For modern device, guest driver will access the device own BAR direc=
tly with
> >>> its own config_data anyway.
> >>>> Should we reserve a region in the PF BAR for SF/SIOV device?, should=
 device
> >>> report which BAR/area to use for the given SF/SIOV device?
> >>>> May be yes, those are different discussions with tradeoff to conside=
r during
> >>> SIOV discussions. It is not related to VFs.
> >>>
> >>> For SIOV it's a given. But we can do this for SRIOV: reserve a PF reg=
ion per VF.
> >> Each VF has its own BAR area for driver notifications.
> > But it is passed through to guest presumably.
>
>
> Probably not in the case of VIRTIO_F_NOTIF_CONFIG_DATA. Did you see any
> problem if we do mediation here except for some performance penalty?

Ok, rethink of this, when using legacy, VIRTIO_F_NOTIF_CONFIG_DATA
should be assumed to be not negotiated. So I think I agree with Parav,
it should not be a problem.

Or do you mean for the devices that have some mandated features?

Thanks

>
> Thanks
>
>
> >


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

