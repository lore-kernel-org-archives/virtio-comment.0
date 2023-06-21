Return-Path: <virtio-comment-return-6452-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7CEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:37:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C956A190908
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:37:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B08FE9865D6
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 20:37:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9ECC8983DDB; Wed, 21 Jun 2023 20:37:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8989D9865CF
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 20:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hW0xI-VKMU2cXpUkPst64g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687379869; x=1689971869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5190ZnbF624Vm1OnBx6QTgUOLS/i+r9tFNgxzjsbfmg=;
        b=ZhgO1aTd5YaKCsc6MkGn42iE0C83aFtE7u4dKstMA68b8DejjfImQ3rY88TuWhV5EJ
         12aw7Our4jfc8IAZDZN+WU4VdRhJ30cth5XwU24HVgC6UZm818JHXEEvgj5kVQcQELGB
         yOFUl6JjLa95M8fVmTsbCpbNLWJJsOBzZusl2SEwzOuDLai302PO4bWyjT/Xs7r5Q6e1
         D/5ZzycFBUYuVRyVH5Pdt+81SrhIcS3AoQ6P2gmOO2JJTKUXSYAlDmXggUI+UfhZownL
         ZUHOOzwD7Prkl9/qnsFtYnkItjy5MDjhWb/e2pC4guKHl65I0eirR+Ka7nuol82hvUqR
         0sXA==
X-Gm-Message-State: AC+VfDzWHAMQh4+NEjpvwtHXmO1TbGyU8PQLrAPytEyPWD6LLMe9D5zg
	bhi5R86u1q0xxecggI1zXsGlyW9vpTwSKHQMSAS3Q5AjQrxXXgrvLRvp71ri4LaBblRhSmximDb
	p1KtRHLjqc2P7PYWkUFvlnKdbh2cqacI0CA==
X-Received: by 2002:a17:907:8688:b0:973:e349:43c8 with SMTP id qa8-20020a170907868800b00973e34943c8mr15485920ejc.69.1687379869469;
        Wed, 21 Jun 2023 13:37:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RF0VondWtNjhj+VqooOtS0uXoJNA5+aPh11dTspLsNLZAMD/dJ+F65YNcSgNshYhgdvqjJg==
X-Received: by 2002:a17:907:8688:b0:973:e349:43c8 with SMTP id qa8-20020a170907868800b00973e34943c8mr15485905ejc.69.1687379869102;
        Wed, 21 Jun 2023 13:37:49 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:37:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230621163116-mutt-send-email-mst@kernel.org>
References: <20230621135052.76028-1-hengqi@linux.alibaba.com>
 <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <20230621152559-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481141E18AAF1BF214A0E29DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Wed, Jun 21, 2023 at 08:24:57PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 4:17 PM
> 
> > 
> > and actually I missed the fact that instead of making this symmetric it forced
> > separate structures for GET and SET.
> > 
> > If we move supported_tunnel_hash_types back to config space then GET and
> > SET just need the active bitmap. *that* seems symmetric to me.
> > 
> > And the field is RO so no memory cost to exposing it in all VFs.
> Two structures do not bring the asymmetry.
> Accessing current and enabled fields via two different mechanism is bringing the asymmetry.

I guess it's a matter of taste, but it is clearly more consistent with
other hash things, to which it's very similar.


Nah, config space is too convenient when we can live with its
limitations. I don't thin kwe prefer not to keep growing it.
For some things such as this one it's perfect.

For example, for migration driver might want to validate
that two devices have same capability. doing it without
dma is nicer.

Another example, future admin transport will have ability
to provision devices by supplying their config space.
This will include this capability automatically, if
instead we hide it in a command we need to do extra
custom work. 

> So we do not prefer to keep growing the config space anymore,
> hence GET is the right approach to me.

Heh I know you hate config space. Let it go, stop wasting
time arguing about the same thing on every turn and instead
help define admin transport to solve it fully.

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

