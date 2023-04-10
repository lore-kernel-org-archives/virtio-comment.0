Return-Path: <virtio-comment-return-5325-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D544C77B6E
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:52:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 84EA787489
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:52:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D0F19863C9
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:52:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7378E9843C6; Mon, 10 Apr 2023 01:52:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60B0C986371
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 01:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2QPuVOLdMq-vRP0PgPaBTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681091532; x=1683683532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gylN7Z2jUkvVQrFHlw811JdEszXdnO/dnVUJcvJzV+E=;
        b=E/f7gHbUu33J7R3YG8nGvZcIgMXwsJWDXzKpLsMysdt/7vu24ePKf3KpGoYoAilpHi
         nykPZXbaCFTZh53ZPjeZYx7IN3g0UeEWNDrHFFd6ZRiKWIIvbWsZ8QOqHc3UDxQk3o/R
         AUS/f7h5s0AL3aNjjuFMwTwhbEHiCi1/XYitpMJG0mJ2qMHWe2oKdo1hGq0XBDVw1fi1
         p6mT5ob2GE9nYP6ZbllxQ+DiNjW56/P10NklHL52Zbcv8AJZf5H1JZ1Pq2R/xAoikMSS
         aHhNeohtfHrUTlO50vU2L+ehUX3CkgCMYOSPpfd+wQlvQqPF/5wC5nv9bWgglAKCUXYW
         /aQA==
X-Gm-Message-State: AAQBX9eIn0i2oJzJTQv4Z8yzU3FQzXHiOIHc2P4lrgc/kmBMK8vfDbL4
	RMJZY9GcawH/BaYPYCmMc8hJM9wm126wIyxcJkWJ2KAUc9ube9ost/va1jD4bQOd+zjm1guevwm
	WEBuMkVYESPHmwjdN/Mno9+KDW4Ia9KU+5CkYFfO/mbsypsaXLg==
X-Received: by 2002:a05:6871:b2c:b0:184:5497:53e6 with SMTP id fq44-20020a0568710b2c00b00184549753e6mr141470oab.3.1681091532754;
        Sun, 09 Apr 2023 18:52:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350YQOVxMqKaYgTeBVqk69VtDBeUcfKeQ3NkZ3mcW4RxQUaVL8nnctuI5udUHwRyq9GuQA/kuQIB9y0UDPqdrhL4=
X-Received: by 2002:a05:6871:b2c:b0:184:5497:53e6 with SMTP id
 fq44-20020a0568710b2c00b00184549753e6mr141464oab.3.1681091532558; Sun, 09 Apr
 2023 18:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230403110320-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EC65708410304D9C1EA3DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403111735-mutt-send-email-mst@kernel.org> <PH0PR12MB54813E4193BC32775BDB2019DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403130950-mutt-send-email-mst@kernel.org> <24e5437e-d6bd-d65c-9ec2-699277a113a3@nvidia.com>
 <20230403135446-mutt-send-email-mst@kernel.org> <PH0PR12MB54815AFE1FE7E1D2AAABBAF4DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403163730-mutt-send-email-mst@kernel.org> <25d15176-042a-f579-0b59-d08f7eb7eafb@nvidia.com>
 <20230407051748-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230407051748-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 09:52:01 +0800
Message-ID: <CACGkMEsMiw31isTvk+c96m-=gfwxaLoUmSMU-Jws1ZL=Ee=nHg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr pci device

On Fri, Apr 7, 2023 at 5:35=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, Apr 03, 2023 at 06:00:13PM -0400, Parav Pandit wrote:
> >
> >
> > On 4/3/2023 5:04 PM, Michael S. Tsirkin wrote:
> > > On Mon, Apr 03, 2023 at 08:25:02PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Monday, April 3, 2023 2:02 PM
> > > >

[...]

> >
> > tvq specific for legacy register access make sense.
> > Some generic tvq is abstract and dont see any relation here.
> >
> > So better to name it as legacy_reg_transport_vq (lrt_vq).
>
> Again this assumes tvq will be rewritten on top of AQ.
> I guess legacy can then become a new type of AQ command?
>
> And maybe you want a memory mapped register for AQ commands? I know
> Jason really wanted that.
>

That's exactly why we decouple the commands from a specific transport
(queue or register). It allows sufficient flexibility.

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

