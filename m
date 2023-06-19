Return-Path: <virtio-comment-return-6379-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175FDEB64DA
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 14:21:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 67DBF7C6BD
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 14:21:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 143ED9863E1
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 14:21:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 083B9986399; Mon, 19 Jun 2023 14:21:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6A89986397
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 14:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: e_nzsAwMMTq8HnAIVwJrcA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184459; x=1689776459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sM3jxiubmf9y/gQYslRwopcHKnmPXCUqfZhxhyaAe0=;
        b=dfAYsmFB2lhud0PAErsUy3hS0QGr7REJjmXqWhf9RM3NcTxxyPJsb8S+7JO38A9fvp
         qHuVmoghoVV/ebLo29P1gzzV+K1NiJ3uNDr1bWG+g/a+hxdfyxOOIWt1lYh2xHnuOJVR
         cQgMmX7PRncuL1SdIXLQj8qa1fcDgoUIf2YucqARK0Wi7zijw6AOGb/f+kkZ3iuEk+OA
         P1HdU8CRCz8A1Dvj6Z/va0/Lt547+nvfGkQZiMLPrgP9OcbfnyoFOMzpifhmQWT50Ahg
         pPByfukvp5RBaRkbVRrcNGr4eky7CSftE0jk5JsmPVvwpB6FE/f2/Zx2SLgUOQpCZabl
         aPGQ==
X-Gm-Message-State: AC+VfDwWuNhRbSjyOiGhiruSknMTfE4B2X7ST0XvF8QlVwJabtEO5NN/
	d92YStggM1jB7cOuqapGJEc02qZ3kcEf8aaabjQW5/81r1pe5BILaU0kvIrGD+kR2hwf7CMTUvn
	EEodKuVq1ph6zv+84n6twsCJZAn0Ayz4Spw==
X-Received: by 2002:a05:600c:2206:b0:3f9:515:ccfb with SMTP id z6-20020a05600c220600b003f90515ccfbmr7130916wml.12.1687184459747;
        Mon, 19 Jun 2023 07:20:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NL8nqhtb2xaY1AziECob7VG+hmylPPztoXz/DI5h5QKmlAelmBWEWAXPTG7XT1PyeLkrK3Q==
X-Received: by 2002:a05:600c:2206:b0:3f9:515:ccfb with SMTP id z6-20020a05600c220600b003f90515ccfbmr7130900wml.12.1687184459400;
        Mon, 19 Jun 2023 07:20:59 -0700 (PDT)
Date: Mon, 19 Jun 2023 10:20:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>
Message-ID: <20230619101745-mutt-send-email-mst@kernel.org>
References: <1686550355.2503424-1-xuanzhuo@linux.alibaba.com>
 <20230612022526-mutt-send-email-mst@kernel.org>
 <1686569235.2395291-1-xuanzhuo@linux.alibaba.com>
 <20230613045854-mutt-send-email-mst@kernel.org>
 <1686810211.4567776-1-xuanzhuo@linux.alibaba.com>
 <20230616101113-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D058584D7AF742C1FEE1DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D058584D7AF742C1FEE1DC5FA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: About custom device counter

On Mon, Jun 19, 2023 at 12:33:33PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, June 16, 2023 10:13 AM
> > > Such as "limit", in a cloud scenario, multiple users purchase
> > > different VMs, and these VMs share the capabilities of the same host.
> > > In order to ensure that each VM will not affect others, the network
> > > card(virtio-net) capability of each VM is limited. When these users purchase
> > VMs, this limit has already been determined.
> > > So if the network card traffic of a vm exceeds the upper limit, packet
> > > loss will occur. It is necessary for us to count these packet losses.
> > > And the device should expose to the user.
> > 
> > OK so here, driver is expected to rate limit yes?
> > 
> Some implementations of txq are lossy and some are not creating backpressure/flow control to driver so driver can rate limit it naturally.
> So a tx packet drop counter is needed to cover the lossy implementations which is abstract enough regardless of reason on why device dropped it.


Yes but Xuan Zhuo here is saying that he wants a register that is
like link speed, not a counter.


> A more granular counter becomes vendor specific that we can possibly avoid or place under different command.


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

