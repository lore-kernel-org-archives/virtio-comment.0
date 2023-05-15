Return-Path: <virtio-comment-return-5897-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28AC77B75
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 10:08:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 36ECC29FC6
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 10:08:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2298D98650F
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 10:08:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 13DD5986396; Mon, 15 May 2023 10:08:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 00FE0986399
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 10:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GCdvAq2wN42snFwEFmhgkg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684145329; x=1686737329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPj/Gj9OyYJSOjP28p2DKbRqk1XA5jZCDifi3xTZyjA=;
        b=hP511+iiQEwwq/Q4xSeXwRs941Hp7/+QYdLhMm4UzkD/fw029OKCTIsU+WoupuTWBB
         WVMICmIuK6fj+VjmNKkQ+fqclvkPCeEw2YhU8qrIGfrO+1pJyzpxjQVC5cp9DOwtA61p
         dhhyt4VBc7S0Gr93mTeHUQmX0lraTNOzy6a6VNfYKKt1JbcurtD22zJyZ29Y2NMAqezI
         u4ESQvQTM8608okeLU8h5zpsJmtOxnU7LhHHUrnswGy7hdvVpv40tJaIc4vrOnrj/Qla
         AhY4oNNGm+tE6fDkR5UsYbEyR6+VvZqGHHJev5dWSMpoaRSozHXfEbnBJA8v/FiKh04g
         5R6w==
X-Gm-Message-State: AC+VfDyyWaMn0g7J6kY9UXlZZ2MwU6xtQCepwZoE1jvmelYOQVZrVJFd
	uWHxz6Z7r7QFogrg6UGLylNeBIm1WprdqNH0Suo4dO9TUjcKyL8og7DtcusBcxGj8+MreLvJycl
	whTBsbhypyRSIpgkhghOI7uhhdbMAS18e7Q==
X-Received: by 2002:a05:600c:2141:b0:3f4:fd67:6d7c with SMTP id v1-20020a05600c214100b003f4fd676d7cmr4359077wml.40.1684145329699;
        Mon, 15 May 2023 03:08:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zVkt+48RniOxLo5/tw3/5fn/3k839X+9bRHRlEKGBdFOUhOokv9bCpCK5P4HT1WFH2mbO2w==
X-Received: by 2002:a05:600c:2141:b0:3f4:fd67:6d7c with SMTP id v1-20020a05600c214100b003f4fd676d7cmr4359056wml.40.1684145329326;
        Mon, 15 May 2023 03:08:49 -0700 (PDT)
Date: Mon, 15 May 2023 06:08:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230515060641-mutt-send-email-mst@kernel.org>
References: <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Mon, May 15, 2023 at 03:30:47PM +0800, Jason Wang wrote:
> 
> 在 2023/5/11 21:02, Parav Pandit 写道:
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, May 11, 2023 8:55 AM
> > > > 1) device features
> > > > 2) driver features
> > > > 3) queue address
> > > > 4) queue size
> > > > 5) queue select
> > > > 6) queue notify
> > > > 7) device status
> > > > 8) ISR status
> > > > 9) config msix
> > > > 10) queue msix
> > > > 11) device configuration space
> > > > 
> > #9 may not even go to the group owner device.
> 
> 
> It the config_msix_vector register so I don't understand why it can't work
> but can work with your proposal.
> 
> 
> > What do we gain from bisecting it?
> 
> 
> 1) No need to deal with the offset in the hardware
> 
> 2) transport independent
> 
> 3) avoid duplication with the (legacy support of) transport virtqueue

To be more specific, device config often has the same layout under
legacy and modern. Thus if getting an offset within device config,
same decoding logic should be reusable between legacy and modern.

-- 
MST


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

