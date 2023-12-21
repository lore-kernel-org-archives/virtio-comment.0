Return-Path: <virtio-comment-return-8831-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DCAC46CCD
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 01:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F6ED2A8E7
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 01:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D66A9868F2
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 01:35:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CDB019865E9; Thu, 21 Dec 2023 01:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71D589865C1
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 Dec 2023 01:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RpwWt7diO5eiDQ4cnyuzTQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703122471; x=1703727271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUQYabeYmfUNLEEayXR9tXHsPjmPmwxj/YDw0KKnj5E=;
        b=OOPpwSphNcdUhhGnjpGwkG4iGwIHtD+BYFtsvHBBbcEhKm03ALymU2VnPqmtca97dq
         Yd2i4TJ1TdQRiUzldkfkvH+ZttpyNKJc4mRgD1evYNNt8+nGgip7oLbF/IDamCXybYRt
         1lfVr50Kbr5Zcqbc7QLo0ZEMODOcD3gv6gefkxzK5QrnhlrNo774vEvy725TmNc1TPoI
         XEhKd7TjjHIg36BjQrEBch1NAFEIJ/NqOfcaghw5Wx2OWYKFj8Z2TTLXvM2NJ4o5KWQ1
         QGYXizAng9VFpbBSRDldS3Sp+aYJboazmjFLBCpnjzPEyJKtg9MfkH82LAT145TxQ4hc
         Q5Og==
X-Gm-Message-State: AOJu0YwDXjYBbv90bJXH/ixYa/J5Hm+iIOxVEnTYmZ32uI+dJ3Pebece
	MVyVqHXUZdWlniLfL/jMR3jVFaShtuCk6iHk5itkoEkxW6LFAebmJwPLWdSM6/yzSuzHBH19yfR
	czdtgq5NZAZtgj1u+EG5LhTCPhI2zkgQipd88pP660UZQVrWElA==
X-Received: by 2002:a05:6e02:16cb:b0:35d:5995:7992 with SMTP id 11-20020a056e0216cb00b0035d59957992mr31645454ilx.44.1703122471063;
        Wed, 20 Dec 2023 17:34:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwOqcPWke/L5fT9aCiJA4RHsH8Fuk/PbNVtuqm+LxSSJqo3Ke9dIi/6HB+QOjM094CzXWN5yBCTT6IAFPHe3k=
X-Received: by 2002:a05:6e02:16cb:b0:35d:5995:7992 with SMTP id
 11-20020a056e0216cb00b0035d59957992mr31645443ilx.44.1703122470842; Wed, 20
 Dec 2023 17:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20231212032713-mutt-send-email-mst@kernel.org>
 <bfd25f86-4292-45d2-a7a2-fe61bde0edb4@linux.alibaba.com> <b739d275-3664-4509-8a91-f19690719475@linux.alibaba.com>
 <fafa078b-14f5-460d-b03e-122afb9156ba@linux.alibaba.com> <CACGkMEuCb13=-b1yMYi3NOehL+6eNWjWsmBHfcYho1w0HwpVBA@mail.gmail.com>
 <6d9353f7-2899-4ba9-8aef-2431c9362207@linux.alibaba.com> <CACGkMEsh9h_syGag48DL9rSSH2Yp4Ht-ES4gA-5rv16Lih_tJw@mail.gmail.com>
 <df90d58d-7e4e-44d7-8896-5fc5b131c164@linux.alibaba.com> <CACGkMEsxsLP=hnybYi2fiKXFq1U1zo+EuKnzfnbT3K_Wcrug5Q@mail.gmail.com>
 <68b0d00b-8b3b-4bd4-9e7c-c3b811dafd8c@linux.alibaba.com> <20231220020428-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231220020428-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Dec 2023 09:34:19 +0800
Message-ID: <CACGkMEspotRCqjgNGbmBfR9SH8P_um4me7TVsomnaJ6Gc9pSmA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [PATCH v5] virtio-net:
 device does not deliver partially checksummed packet and may validate the checksum

On Wed, Dec 20, 2023 at 3:35=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Dec 20, 2023 at 02:30:01PM +0800, Heng Qi wrote:
> > But why are we discussing this?
>
> I think basically at this point everyone is confused about what
> the feature does. right now we have packets
> with
> #define VIRTIO_NET_HDR_F_NEEDS_CSUM     1       -> partial
> #define VIRTIO_NET_HDR_F_DATA_VALID     2       -> unnecessary
> and packets without either                      -> none
>
> if both 1 and 2 are set then linux uses VIRTIO_NET_HDR_F_NEEDS_CSUM but
> I am not sure it's not a mistake. Maybe it does not matter.
>
> What does this new thing do? So far all we have is "XDP will turn it on"
> which is not really sufficient. I assumed it somehow replaces
> partial with complete.

It looks not? CHECKSUM_COMPLETE is less optimal than
CHECKSUM_UNNCESSARY as validation is still needed.

If I understand correctly, this new thing wants DATA_VALID only.

Thanks



> That would make sense for many reasons,
> for example the checksum fields in the header can be reused
> for other purposes. But maybe not?
>
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

