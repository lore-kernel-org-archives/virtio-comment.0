Return-Path: <virtio-comment-return-5842-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61C2C7EE23
	for <virtio-comment@archiver.kernel.org>; Tue,  9 May 2023 15:15:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E3E952AEF4
	for <virtio-comment@archiver.kernel.org>; Tue,  9 May 2023 15:15:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D826E986547
	for <virtio-comment@archiver.kernel.org>; Tue,  9 May 2023 15:15:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CEC6C986542; Tue,  9 May 2023 15:15:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB374986533
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 May 2023 15:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G358BTZeMeO3RnBtl6GdIA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683645318; x=1686237318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xI0401wP+xvLSV7mgAJKIOuzttpl7/ohCO2AR9DIlyM=;
        b=WwWop/d8I5Dc57/7RfLnSz+VcEvVRbpywzpANfzjgdHJOtF10/N4vOeLq8Sd2HmzLu
         a3Am3kdgIJ9fVvgmSAQ6Z738toqDbdJDuELwnccwd6pMhAAAXSYbetjoCOmul1P/04es
         2eJTz5ADr73HlSbcyh+StIdCFz6wt/rQ31jUSGG2Cvg0z3k8EpXm5vCw31GsR1Iwq3Yx
         Se9kqpzhenIp2nsTdAP9WGa5V0hIVT/MbfqNIpfVkhe6d1m0A7up/FFzV9lnMXzcth+c
         ITxCIXBC5RC1NjK2COscZ2jabO4AaN5Q6jvXtymGtNIWyTkDUrFRghL41/M8vmblAWOx
         td2A==
X-Gm-Message-State: AC+VfDzs8lMhbbcGzBsglniMxESrmsJCtdgEsyLgAMYDjnH5LrGuaYqa
	bsMaZ/hmUfe2e+X0YK9G75RgXmbzNkeFhpqal1agylqrjGuqRWKjivcyKfNdm1MFK38D1Gi9dpY
	yypnRUVLyhQrMOlITG+GRQUvmB8oknkZCLw==
X-Received: by 2002:a1c:ed13:0:b0:3f1:6fb3:ffd4 with SMTP id l19-20020a1ced13000000b003f16fb3ffd4mr9325452wmh.6.1683645317913;
        Tue, 09 May 2023 08:15:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gyp+BfDIbOsIPkebg+KQNrI3kqCqD2HgzeTdqgnKc4g8zwu9zPCfdjnAO2UoKq2cwFUkh6w==
X-Received: by 2002:a1c:ed13:0:b0:3f1:6fb3:ffd4 with SMTP id l19-20020a1ced13000000b003f16fb3ffd4mr9325428wmh.6.1683645317594;
        Tue, 09 May 2023 08:15:17 -0700 (PDT)
Date: Tue, 9 May 2023 11:15:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230509110941-mutt-send-email-mst@kernel.org>
References: <20230423073532.105636-1-hengqi@linux.alibaba.com>
 <20230425165659-mutt-send-email-mst@kernel.org>
 <19e6d4e6-e3d8-7eca-4d54-d113b4cc5504@linux.alibaba.com>
 <20230426104538-mutt-send-email-mst@kernel.org>
 <5463159d-daa2-101b-6abf-ea7aa4f40bd0@linux.alibaba.com>
 <20230427130008-mutt-send-email-mst@kernel.org>
 <20230505135115.GA110622@h68b04307.sqa.eu95>
 <20230505105427-mutt-send-email-mst@kernel.org>
 <e3930c64-b7eb-a01e-39c9-0fe718756185@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <e3930c64-b7eb-a01e-39c9-0fe718756185@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [virtio-dev] Re:
 [virtio-comment] [PATCH v13] virtio-net: support inner header hash

On Tue, May 09, 2023 at 10:22:19PM +0800, Heng Qi wrote:
> 
> 
> 在 2023/5/5 下午10:56, Michael S. Tsirkin 写道:
> > On Fri, May 05, 2023 at 09:51:15PM +0800, Heng Qi wrote:
> > > On Thu, Apr 27, 2023 at 01:13:29PM -0400, Michael S. Tsirkin wrote:
> > > > On Thu, Apr 27, 2023 at 10:28:29AM +0800, Heng Qi wrote:
> > > > > 
> > > > > 在 2023/4/26 下午10:48, Michael S. Tsirkin 写道:
> > > > > > On Wed, Apr 26, 2023 at 10:14:30PM +0800, Heng Qi wrote:
> > > > > > > This does not mean that every device needs to implement and support all of
> > > > > > > these, they can choose to support some protocols they want.
> > > > > > > 
> > > > > > > I add these because we have scale application scenarios for modern protocols
> > > > > > > VXLAN-GPE/GENEVE:
> > > > > > > 
> > > > > > > +\item In scenarios where the same flow passing through different tunnels is expected to be received in the same queue,
> > > > > > > +      warm caches, lessing locking, etc. are optimized to obtain receiving performance.
> > > > > > > 
> > > > > > > 
> > > > > > > Maybe the legacy GRE, VXLAN-GPE and GENEVE? But it has a little crossover.
> > > > > > > 
> > > > > > > Thanks.
> > > > > > But VXLAN-GPE/GENEVE can use source port for entropy.
> > > > > > 
> > > > > > 	It is recommended that the UDP source port number
> > > > > > 	 be calculated using a hash of fields from the inner packet
> > > > > > 
> > > > > > That is best because
> > > > > > it allows end to end control and is protocol agnostic.
> > > > > Yes. I agree with this, I don't think we have an argument on this point
> > > > > right now.:)
> > > > > 
> > > > > For VXLAN-GPE/GENEVE or other modern tunneling protocols, we have to deal
> > > > > with
> > > > > scenarios where the same flow passes through different tunnels.
> > > > > 
> > > > > Having them hashed to the same rx queue, is hard to do via outer headers.
> > > > > > All that is missing is symmetric Toepliz and all is well?
> > > > > The scenarios above or in the commit log also require inner headers.
> > > > Hmm I am not sure I get it 100%.
> > > > Could you show an example with inner header hash in the port #,
> > > > hash is symmetric, and you still have trouble?
> > > > 
> > > > 
> > > > It kinds of sounds like not enough entropy is not the problem
> > > > at this point.
> > > Sorry for the late reply. :)
> > > 
> > > For modern tunneling protocols, yes.
> > > 
> > > > You now want to drop everything from the header
> > > > except the UDP source port. Is that a fair summary?
> > > > 
> > > For example, for the same flow passing through different VXLAN tunnels,
> > > packets in this flow have the same inner header and different outer
> > > headers. Sometimes these packets of the flow need to be hashed to the
> > > same rxq, then we can use the inner header as the hash input.
> > > 
> > > Thanks!
> > So, they will have the same source port yes?
> 
> Yes. The outer source port can be calculated using the 5-tuple of the
> original packet,
> and the outer ports are the same but the outer IPs are different after
> different directions of the same flow pass through different tunnels.
> > Any way to use that
> 
> We use it in monitoring, firewall and other scenarios.
> 
> > so we don't depend on a specific protocol?
> 
> Yes, selected tunneling protocols can be used in this scenario like this.
> 
> Thanks.
> 

No, the question was - can we generalize this somehow then?
For example, a flag to ignore source IP when hashing?
Or maybe just for UDP packets?

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

