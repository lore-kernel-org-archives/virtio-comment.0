Return-Path: <virtio-comment-return-8584-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8C9C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:26:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF7BB6E6CB
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:26:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8EC449868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:26:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 73479986890; Fri, 24 Nov 2023 03:26:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 608299868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uNOfjZ3TM8mehAyjafG5uQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700796353; x=1701401153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NZw7f2/SISHMq+egRXyjQvrlgmeSh18E5ulhN8QqtQ=;
        b=k09uf/FRWrqaylVBVXpYxaW/Qxn62iB1iQQlRTa2lkAH9fXJxQDi6fAkmDeAiCbis+
         BjfcnSIzPXxkFtIYorwj76j+LtlsLYIeDITjFZqa+WO2aQbQy8SBay71K46WVC6ltPU7
         OqXXi681HtJ3QmdMq/6RbCwOqcKkskbhpGkvdjoKcVN9b/QNycaLfEFSD2tO4OkCJfeX
         LqZ48fFwW3+9jWhVEE/yemRsTLzN5M5BVZiemvq2IHFKJwLPnBMGhgUkL2zh73j5ao4U
         tlwV/8ErwZ8w4PYu2HPxOPQG24jZRb3XHNVfTUHiRTSnxNsLhc1ynac/HZqc0vvZFCC+
         E6yg==
X-Gm-Message-State: AOJu0YwVytH08Kd5qFFDYO2Lylm1q0WEgc9XYN7nySLDMzV8Mms9O57c
	QOKYELNcxuSiy6A6Uw1PZokaz4g73uxcik99YDABz/May+Ty08mRVWI/t1bNtuRydLqZjEHun1a
	0LL7PJZ2cWz+Hvd13V2twR4qe8KOY9A4KYsEtTJZN/cU6RswSvQ==
X-Received: by 2002:ac2:5bdd:0:b0:507:bc6b:38a6 with SMTP id u29-20020ac25bdd000000b00507bc6b38a6mr688666lfn.33.1700796353088;
        Thu, 23 Nov 2023 19:25:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF30q/M9hCjAaKqIMzNS5jCHTuNDmWmuRWMIlj+Ruz1b/031rWwzoTlYiIiErawbLi0iah5JSnbr8LUYUbg8/g=
X-Received: by 2002:ac2:5bdd:0:b0:507:bc6b:38a6 with SMTP id
 u29-20020ac25bdd000000b00507bc6b38a6mr688662lfn.33.1700796352825; Thu, 23 Nov
 2023 19:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com> <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com> <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org> <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:25:41 +0800
Message-ID: <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 10:59 AM
> >
> > On Wed, Nov 22, 2023 at 5:18=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com>
> > wrote:
> > >
> > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > Lingshan claimed that suspending device is for live migration in =
commit
> > log and in discussion he portray it as some basic facility unrelated to=
 device
> > migration such as debug etc.
> > > > > Instead of claiming it as some non_device_migration facility does=
 not
> > make sense.
> > > >
> > > > It is used for migration for sure.
> > >
> > > Well having a generic facility to stop device sounds like a nice thin=
g.
> > > However the devil is in the detail. A lot of detail here seems very
> > > much tailored to a very specific implementation in mind.
> > > So thinking through how it will work e.g. for power management would
> > > be a good excercise to figure out how it should work in detail.
> >
> > It might work in the case where there's no PM support in the transport.=
 E.g for
> > MMIO devices.
> >
> MMIO should implement PM like other transport. That brings the equivalenc=
y principle.
>

MMIO are usually platform devices. I don't see the point.

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

