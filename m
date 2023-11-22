Return-Path: <virtio-comment-return-8531-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF30C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:28:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C7CD2354F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:28:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08D0D9868A3
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:28:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F26AF9843C0; Wed, 22 Nov 2023 05:28:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4B94986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 05:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gmzfdEijM96WgdDf60mwxw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700630930; x=1701235730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t40VE7aRIRugLvZiSm5QWr6yWkw6ac3D1f/nnjhpmlo=;
        b=MYvP3V3KYCbawXjw2SE6opCqSXFyBG7TJyDw63agtSOhxm/5T3MbnC9eepNlWI3Aho
         M6CMoOeeonxchwsVGN1LzfwT1HwKKsn8TA1PSxIoB2v6iY9JmiVY47R/xnoOwUWPDCUC
         q2KyzV7kasHib75qz0T7Pkv9TB1reZvFYdhc6h9NRlJ5kHUL4zvrXhQIseBRIR8WngId
         aq/BwdiA89/2f5272k8MpNKSUxNsQBiqzmDoWvvnm/RGPdMax0ppyMIQQvyDuKwUHO8F
         Ht8WiGdJRD9Wv2gJ3TgZjDRp/UFHLQxMjrNuLdOWSSbjqgT7P/NqC1iHwhNaXdG1Dkq1
         4yIQ==
X-Gm-Message-State: AOJu0YzUEidSAizMvtRtBGtQ9zYECl17kEXcf2HGEE6DmhJtCxxvO4+d
	3iYCUW7ksh7EQBbHiG95BxNniWYLRqC4GPUArYXv36h8KtAUsamhfZLP5YpDUur5tGzB25n3uSv
	TnzD0k2qz1Z/v6Lvl/DUa7aRgCO/hvMucdNQOhZDRoQ4JHRzuzw==
X-Received: by 2002:ac2:4c09:0:b0:50a:2710:bea2 with SMTP id t9-20020ac24c09000000b0050a2710bea2mr738412lfq.55.1700630930694;
        Tue, 21 Nov 2023 21:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfa0zCWURvDHegf41qJO39BLgZ7LQ1lBQmtiRlX8G1YmB8YPO0qYIR6TyckprFpfsI60zds8taz4kUQLMNWNY=
X-Received: by 2002:ac2:4c09:0:b0:50a:2710:bea2 with SMTP id
 t9-20020ac24c09000000b0050a2710bea2mr738403lfq.55.1700630930370; Tue, 21 Nov
 2023 21:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com> <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com> <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com> <20231121161218-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231121161218-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 13:28:39 +0800
Message-ID: <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Wed, Nov 22, 2023 at 5:18=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > Lingshan claimed that suspending device is for live migration in comm=
it log and in discussion he portray it as some basic facility unrelated to =
device migration such as debug etc.
> > > Instead of claiming it as some non_device_migration facility does not=
 make sense.
> >
> > It is used for migration for sure.
>
> Well having a generic facility to stop device sounds like a nice thing.
> However the devil is in the detail. A lot of detail here seems very much
> tailored to a very specific implementation in mind.
> So thinking through how it will work e.g. for power management
> would be a good excercise to figure out how it should work in detail.

It might work in the case where there's no PM support in the
transport. E.g for MMIO devices.

Thanks


> Parav did you indicate at some point a virtio specific SUSPEND
> bit can be useful for PM? Could you share how it's better than
> transport level PM and what the requirements are?
> Thanks!
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

