Return-Path: <virtio-comment-return-6472-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F76BEB64D8
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 65CDA7A1D0
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5878398664C
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50C109865DB; Thu, 22 Jun 2023 17:11:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F46B9865E9
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 17:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ZPbybnqbMx2Te4w7RkckPg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453867; x=1690045867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZvDnOc0jFBoSOXptY1sxXNXYpqdEJ8Nbv2lE0IowdY=;
        b=C6/7JKp04lY4/YwHMfmRJex0X5/1zM2DpDAaIYRliIRb4JyrBthDNtYOUeqdGnmF/O
         EL85hfrOm4abFaFvAE7/f+zLP9G9Lmhj3M2SDc6kypuJmaP1e48uSF2ga5E2BqxUjTO6
         hugYP6peseDqYP1crMyJPhimctiH1b7TIAnCgBvvNt7IjcSBA2ZH0OlgN82G0xzSctC1
         gu1glLi1gOdX0CT3b4i/nWy1041I6Hv6ozkUM1Hw11QYnhUOEpvD/998SrUhGrsiuWKB
         ut6DHpLlAn5cOyuCND1vdFa6sTyJhURkAyCf13IW9CHC3PjzOyAXgZVyQl+ua/z5gZ2C
         KYVg==
X-Gm-Message-State: AC+VfDxjCA6hw4IcsGQuE3jJ6bjq5mbToOk3rIym7K28HHCD3alGeYT5
	B1zfST8qJMU/hhfdZsBYfNb7l+prg+W+SiH1r0bxuUiQv9cFoc6/2vhM0uL47VdTmfVKlBaUPmm
	OZZzRQHg0F+V/scEFyr/HEm2ZuY+Zdt6mtQ==
X-Received: by 2002:a17:907:9450:b0:989:2a82:fb02 with SMTP id dl16-20020a170907945000b009892a82fb02mr6023370ejc.51.1687453867203;
        Thu, 22 Jun 2023 10:11:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wQA/CuMhD1MnezZgEDDngpYsS9Qe2Q5xqhXa3kM7R/Ag56HVp6+d+GMVaphYUsUsNes/YRg==
X-Received: by 2002:a17:907:9450:b0:989:2a82:fb02 with SMTP id dl16-20020a170907945000b009892a82fb02mr6023365ejc.51.1687453866938;
        Thu, 22 Jun 2023 10:11:06 -0700 (PDT)
Date: Thu, 22 Jun 2023 13:11:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622130359-mutt-send-email-mst@kernel.org>
References: <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622021932-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Thu, Jun 22, 2023 at 12:32:33PM +0000, Parav Pandit wrote:
> Provisioning driver usually do not attach to the member device directly.
> This requires device reset, followed by reaching _DRIVER stage, querying features etc and config area.
> And unbinding it and second reset by member driver. Ugh.
> Provisioning driver also needs to get the state or capabilities even when member driver is already attached.
> So config space is not much a gain either.

Actually it's RO so you *can* read it without any issues:
- block guest access to status
- check DRIVER.
If set:
	- read features, config
If not set:
	- read features, config
	- reset

I am not saying it is elegant but then all of vdpa pile of
hacks is not elegant.

And I am all for building something better but we didn't
build it yet.

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

