Return-Path: <virtio-comment-return-5875-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A319C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:45:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2953F11B69C
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:45:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D1F29865F9
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:45:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 10ECB9865D0; Thu, 11 May 2023 13:45:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1C8E9865DB
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 May 2023 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rEg8hwNhPEOglm3ZCCHKNA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812718; x=1686404718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qiNKzBUITfQ4aWL7PO1WLDKbnmTH8PmWrvEZRGiW9k8=;
        b=PzMMW6u8SYw0MM+Oqzwl/75SvaiIZl9RiuXKUkSi++pXIi/0uUw5Iji908/v4RA9oY
         mNZKVdaUBQOov65wGonZf+TiNTvif3eJFGC0BD8tzvTbltbu6wu0TfvG74CbtB6+9IBD
         4Z1tHE5z3VKs65RN9/GLzM0m8A7Tw+Ra5Qc/aENfC0LloQ7eTuS36ZR9AolfoQ8TtyEk
         1Il6Yp6KkmBIEhrHzeuQE0xbft9DomJK3FZsXh1trzWSNNv2zW31nVapjNmxTfzghiVv
         3iDXdb8W7IFzbOzmrwoYR3W2WD/iBJODhEzdt6eOZONJCZg6LUaNDflNQPtOPdiB+cVy
         uqtg==
X-Gm-Message-State: AC+VfDzMq17q+5KLzYefA16KUMF0Pincxl2k6C72CIDI+XQRYLI2cGlN
	0HEqsuURuJQOCmhTgYlS/xXEmCsqegn2OVJiXQwvWZojSdBAkVYYg4DkXLuoGt+CESHAlksSzwp
	kmlumH5L+p/1Q974y6wevC3JhjPVNCABPZg==
X-Received: by 2002:a7b:cbcf:0:b0:3f4:2452:966a with SMTP id n15-20020a7bcbcf000000b003f42452966amr11032348wmi.27.1683812717949;
        Thu, 11 May 2023 06:45:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+O7wmz8gyAIhxnmTvmHRPN+BVBlgA63woVSZdK+MKzfeQliIZ69fnOpd2Zzc7LR/pVcXSJQ==
X-Received: by 2002:a7b:cbcf:0:b0:3f4:2452:966a with SMTP id n15-20020a7bcbcf000000b003f42452966amr11032322wmi.27.1683812717587;
        Thu, 11 May 2023 06:45:17 -0700 (PDT)
Date: Thu, 11 May 2023 09:45:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230511094149-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <PH0PR12MB5481BCA4D8F6546B3300DD29DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481BCA4D8F6546B3300DD29DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Thu, May 11, 2023 at 01:15:15PM +0000, Parav Pandit wrote:
> > Why not simply invent individual commands to access legacy facilities like
> > commands to access like what transport virtqueue did for modern
> > device?:
> > 
> I don’t see how this is being any different than register-offset interface.

For example legacy device config's offset moves depending
on MSI enable. Which is a missing piece in the current
proposal btw as I keep saying.

Setting a flag or using a separate command for device config
does indeed sound cleaner.
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

