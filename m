Return-Path: <virtio-comment-return-6563-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FA3EB64D7
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 05:37:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7D375419A6
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 05:37:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68F89986570
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 05:37:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5716098654C; Wed, 28 Jun 2023 05:37:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4085798654F
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 05:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dWk8uin6N4iKKokHrrTQVQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687930667; x=1690522667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVVnDMF4VJG/ExbkYBU0BS7273O+/77JugdBOrA3NAo=;
        b=J+Of4mkJhMnxZii9cGTKBKdam4xeRypmSQHiIwDGNLd2KAV5lD1ovMnSBFNMa3q84v
         HInoVks5JUp7rT0sGoKCWqbSCPu/OORHyNOjWH1J44UBQRt12CjgEGkZrWnCQcVu+KzO
         pIT/sREP3RK6PDtpOvShLXOgQy+SaKOdRzWqdvif5C3KGsu4Bko2iAf8qu9cj6ap+OGG
         FLVLcAxgXwJoDCEgJ0MMp1l54mNuglH3qs2Wmz39YWRKW/KXkmmfbi1SWWNa3PPoA8ZV
         0/5QWst+PbsHj2W0xidJUT02T+eFQQ6muPgxHu79yyLzKt2lWvEAZEInu2jsWRHgP1q4
         i3mg==
X-Gm-Message-State: AC+VfDxdDOxBsNYwtF2LyacH3RsoGEU9yjbe3/iSIz/WHji9OL6G594f
	zqvKswnnF/J4z3YpVGGgfeOLSvs/BShBWmlN9POorqxYCOYELtDishGcugix6rhp7t+arhMj+BU
	KTqj1H6XmdmLiJ97bUN9QEGZCLQa/3nzeTFIKMmECPycc4rxGuw==
X-Received: by 2002:a2e:9e4f:0:b0:2b1:b4e9:4c3 with SMTP id g15-20020a2e9e4f000000b002b1b4e904c3mr23226098ljk.2.1687930667392;
        Tue, 27 Jun 2023 22:37:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zNeRyVdR0+DYjHLdtWZiu+RrqU9X8gM9KHmgiycs97Gmwc8j8wVpzkFv8v8q2jGDwqNwHARK7EVLQULjPqQQ=
X-Received: by 2002:a2e:9e4f:0:b0:2b1:b4e9:4c3 with SMTP id
 g15-20020a2e9e4f000000b002b1b4e904c3mr23226080ljk.2.1687930667060; Tue, 27
 Jun 2023 22:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com> <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811123CFCDEFE3B48D4381DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 28 Jun 2023 13:37:35 +0800
Message-ID: <CACGkMEtgomh1EGNLqhXQssRW02nnHkamxT5rV5eZZ9BZFH=uJA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v19] virtio-net: support inner header hash

On Wed, Jun 28, 2023 at 12:23=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, June 27, 2023 11:46 PM
> >
> > Having it in the config space, then a type agnostic provisioning throug=
h config
> > space + feature bits just works fine.
> >
> Provisioning is far simpler thing to do in device specific way than askin=
g device to store this value in onchip area which is rarely accessed.

Are you suggesting to not place any new fields in the config space?

struct virtio_net_config {
        u8 mac[6];
        le16 status;
        le16 max_virtqueue_pairs;
        le16 mtu;
        le32 speed;
        u8 duplex;
        u8 rss_max_key_size;
        le16 rss_max_indirection_table_length;
        le32 supported_hash_types;
};

Which of the above do you think can be accessed frequently and which
part of the spec says it must be stored in the onchip area?

Thanks

> There are many fields of many features for 1.4 are discussed including th=
is one. All of these capabilities just cannot be stored in config space.
>
> > If we move it only via cvq, we need device specific provisioning interf=
ace.


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

