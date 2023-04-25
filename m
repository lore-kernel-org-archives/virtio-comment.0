Return-Path: <virtio-comment-return-5633-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38972C6FD18
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:15:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2BF9442BF2
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:15:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE91298646D
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:15:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A61F798643F; Tue, 25 Apr 2023 13:15:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95DBF986449
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Apr 2023 13:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: s5gMkQmlOmSy7WRQYEb2Gw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682428518; x=1685020518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQpQSVv9kFXwXLkZplo4IZLL5jSpWQN9p3JILvggdzM=;
        b=ewV5eBt+f/sd4dghsr0QeBt8o/8AivAmpB50f14seQO3fDJsewAZWD82zKmL4cxHV1
         TnGVOm2NLdjhAd65QHlbfJF5d12gFbiYjnLQzTwD5Yn/fDJoGZH912OSZ57tt5x77NuJ
         6XKpv8qqCDl1aGQWSNY1C0MWwCmOq6bt0a56jSj1FOIzf5ZsRNeF8DPr1lKdELDO2/kY
         azOPFnfqZAnNJYuCaleUceaYfAE7y4BSoG7awoMyZcdEGNSQMBuGGs22QboN4V3yWekt
         i0B+pApKm55hVkQEdVQhjmOCXyQk25rs0J50q2XMz9X3nURDEm+fgfxSXOtPpRAU9bPH
         +Emw==
X-Gm-Message-State: AAQBX9d8Qkm6ac2y0Smn4/O/fib5nE0MFOjW69RYkOnH73GQbtYuXCw3
	XOShanKNXJcWVK0BKa9FlfNlLqCI0CKXsyuZooQoTieGllQZZiJ9T3PldbRObvYoxqUjWURBu3N
	iiYU/+kLuy0249bXqFEQ+Hb87/e8iCxybDg==
X-Received: by 2002:a5d:56cb:0:b0:2f9:b4a1:68cb with SMTP id m11-20020a5d56cb000000b002f9b4a168cbmr11870026wrw.3.1682428518445;
        Tue, 25 Apr 2023 06:15:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bxw1Bdv5cjdG5LrCF7d3pEAioQGiUAz9p0ZYGtqg7Kebqi5k+nsK5lZnhLNXdzYVotrlnPEw==
X-Received: by 2002:a5d:56cb:0:b0:2f9:b4a1:68cb with SMTP id m11-20020a5d56cb000000b002f9b4a168cbmr11870010wrw.3.1682428518059;
        Tue, 25 Apr 2023 06:15:18 -0700 (PDT)
Date: Tue, 25 Apr 2023 09:15:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230425091058-mutt-send-email-mst@kernel.org>
References: <20230419014639.919458-1-parav@nvidia.com>
 <20230419014639.919458-5-parav@nvidia.com>
 <20230424152919.70254ffa.pasic@linux.ibm.com>
 <PH0PR12MB5481ABEFADC3ECFD93E645FADC649@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230425150215.1c445755.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230425150215.1c445755.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] RE: [virtio-comment] [PATCH v14 04/11]
 transport-pci: Avoid first vq index reference

On Tue, Apr 25, 2023 at 03:02:15PM +0200, Halil Pasic wrote:
> On Tue, 25 Apr 2023 04:10:00 +0000
> Parav Pandit <parav@nvidia.com> wrote:
> 
> > > From: Halil Pasic <pasic@linux.ibm.com>
> > > Sent: Monday, April 24, 2023 9:29 AM
> [..]
> > > 
> > > In [1] you state the following: "There is nothing like a zero based index. A VQ
> > > can be any u16 _number_ in range of 0 to 65534.
> > > Number can also start from zero. So zero based index = zero based number."
> > > 
> > > I don't really understand what do you mean by this,   
> > Like you described the vq index range is device specific and it is already documented in each device type.
> > 
> 
> Yes, but we don't actually spell it out. In virtio 1.1 "index" or
> "virtqueue number" can be found in chapter 5 "Device Types".
> 
> Yes each device has a section "5.X.2 Virtqueues", but we don't spell it
> out that the numbers 0, 1, 2 are actually virtqueue indexes.
> 
> > A driver can choose to enable its "first VQ" located at vq index 2 for a specific device type.
> > So, for device the first VQ is vq index 2 instead of 0.
> 
> You read "first queue" as the queue that was "enabled" first. I tend to
> agree, the queues can be "enabled" in any particular order. But I don't
> agree that the queue that was "first enabled" is the what the spec
> currently refers to as "first queue".
> 
> I don't really agree with your statement. For example, IMHO, it does not
> work if the device has just one queue (like block, entropy) or just two
> queues.
> 
> I'm convinced, for the device the first vq is always the queue with
> index 0, if there is such a thing as "first vq for the device". I believe
> the specification does not need "first vq for the device" and similar,
> because what we actually need is "the queue with virtqueue index N".
> 
> > 
> > PCI spec wrote "first queue is 0", this was little misleading how driver and device see it.
> > 
> > So vq index starts from 0 but it need not be the first VQ, that's what I meant by above line and range description.
> > 
> 
> 
> IMHO we should make sure the spec can not be read in this way. Because
> if one was to choose the vq index 5 from the allowed range of [0..65535].
> And try to "enable" the vq with index 5 as the first and only queue of
> the virtio-blk device, and use it as such: well that would not work out
> well.
> 
> > > but I'm afraid it is not
> > > consistent with my understanding. Can not be any number in range of 0 to
> > > 65534.
> > > 
> > > Rather in general it depends on the device type, and on the device how many
> > > queues it support. Let us call this number dev_vq_max. And if dev_vq_max > N  
> > > > 0 index is associated with a queue the N-1 index is also associated with a  
> > > queue.
> > > 
> > > Let me also note that the number of queues supported/provided by the device
> > > is a matter of the device. For many devices the number of queues is a constant
> > > given in the specification. A Network Device tells its driver how may queues it
> > > supports via max_virtqueue_pairs, Crypto Device via max_dataqueues, and
> > > Console Device via max_dataqueues.
> > > The transports PCI also has num_queues which is documented as "The device
> > > specifies the maximum number of virtqueues supported here." while CCW and
> > > MMIO have no transport specific means to tell the driver about the number of
> > > queues supported by the device. In any case, if the number of queues provided
> > > by the device is N, each of those queues is uniquely identified by exactly one
> > > index from the range [0..N-1]. Furthermore the role a certain queue plays is
> > > determined by its index. E.g. for the Console Device virtqueue identified by the
> > > index 3 is the "control receiveq".
> > >   
> > Sure. All you wrote is correct.
> > 
> 
> I'm happy we agree. All I say we may want to rewrite the 
> 
> "Each virtqueue is identified by a virtqueue index; virtqueue index
> range is from 0 to 65535 inclusive."
> as
> "Each virtqueue is uniquely identified by a virtqueue index. The number
> of supported virtqueues is device dependent, but can never exceed 65536.
> Thus 16 bit is sufficient to represent virtqueue indexes. If the number
> of virtqueues currently supported by some device is N, each of it is
> virtqueues is uniquely identified by a single index from the range
> [0..N-1]."

Seems to be repeating same thing over and over.
This redundancy has cost, e.g. more places to change when we
talk about admin queues.
Yes it can not be any number 0 to 65535 but this kind of nitpicking
belongs in conformance statements not in general description.


> And it may be ester than doing a separate issue+ballot for it.
> 
> Regards,
> Halil
> 
> > 
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> > 


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

