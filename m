Return-Path: <virtio-comment-return-6929-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A281C001DC
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 07:02:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E50D6846D
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 07:02:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99537986385
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 07:02:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8EF0E983EBE; Mon, 31 Jul 2023 07:02:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A309986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 07:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QP8ojLRGP-2LdMqFirAe6Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690786929; x=1691391729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrcGI2uksWfjLtEGkBh29yrVD98Eqzzcw7+ZwLEIU3U=;
        b=KCmQcWnTVthiQH/bxWvxBMOcOS0briFd2m04lkQnK0K687W/E7EsmjkhdXOFYebmNI
         PNDsRxVgteyLoNzh7FS4EukJd9N/NYJWjARFMUL52V/EOQytRJ6JZFBIa3O5tKtPHvmW
         jdTSRsBLEL1TZ3vXqR6ikG5udfvKj9DNbRZLass37RVeXAtJeGY9J02Bdm14UG0VFRZx
         FdrDaZ4XIf5kIXP+3t5LnxZ5DZgPb8lUO6eXIzkAlBK21ZSg6xNMyQ1DMEd4K+u86+4+
         PthX5gbtdnsRrxnYFF7Pd1Cz5jACmbXr3K8tnqd3qyoOQk3Tiej6z72juz32NiyvXsbq
         P//A==
X-Gm-Message-State: ABy/qLa1cPIhyInb95KwGvPWc6Cf6sSEpUqUnGCL9UR5DGZwK0TySDBs
	z79BL1KK1zTL9493VyqWR8mA0bCkxRujugcp7jw18pJetbP2rnedZNaHqShkuQDJ9dxFVvhChdz
	lC0eoTXOB7oSbX0OjMbNz5m/EqbEz3r/rnxCtfpffH8eFqepBkQ==
X-Received: by 2002:a2e:9c5a:0:b0:2b9:e0bf:fc58 with SMTP id t26-20020a2e9c5a000000b002b9e0bffc58mr2270633ljj.13.1690786929583;
        Mon, 31 Jul 2023 00:02:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMJVAvzTkgOzFABax/2X8rgMzWlYsX2/N/isFeULCa4jcrLm+iqgIpuHv5iSoGcd8vzdygvbFsjb1kYU4pYyY=
X-Received: by 2002:a2e:9c5a:0:b0:2b9:e0bf:fc58 with SMTP id
 t26-20020a2e9c5a000000b002b9e0bffc58mr2270619ljj.13.1690786929271; Mon, 31
 Jul 2023 00:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230726081229.55947-1-xuanzhuo@linux.alibaba.com>
 <20230726070801-mutt-send-email-mst@kernel.org> <1690422490.8491526-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548149ED4C687913EDA3EED9DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548149ED4C687913EDA3EED9DC05A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 31 Jul 2023 15:01:58 +0800
Message-ID: <CACGkMEuGY4H=O_8Cyu84ziAFJWcZiEzHmEqO0vYN4h65NSBvnw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v13] virtio-net: support device stats

On Mon, Jul 31, 2023 at 12:32=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Thursday, July 27, 2023 7:18 AM
>
> > > why don't we have a config space field for supported types?
> > > more straight forward than complex rules...
> >
> > I am ok for adding a config space field.
>
> During 1.3 we completed the discussion that any new config field addition=
 must adhere to DMA interface and not a register.
> Multiple capabilities need this.
> So lets please work on that.
>
> Counters needs to use the dma interface and it can wait one time to utili=
ze the modern interface.
>
> I have two proposals to for the dma interface and we should discuss that =
in separate thread to not mix the cvq parts of the stats.
> I will start the thread shortly and put pointer to this requirement of co=
unters + many others that we are discussing including ntuple.

It's really the charge of the transport to determine the way to access
the configuration space, not the device itself.

CCW had already used DMA to access device configuration space. PCI can
do the same.

Thanks

>
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

