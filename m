Return-Path: <virtio-comment-return-4684-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1ECC61DA4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 00:18:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4760387CD4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 00:18:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3ABCF9866BD
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 00:18:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 314069865CF; Mon,  6 Mar 2023 00:18:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CECC9866B7
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 00:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5roi62dUM0uvGD7F1qAkgg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678061910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG2LuezUgoMHukqpRbKkIXmj3j24v1z7C9sqB1Q2Gaw=;
        b=PchiEpQH4vTVgjsRcSZcpUDz6TR5nXwPJ7UoS2gAJ6x9G9CBjE2V+zyIiU8yRLShps
         NDtxooPx5wGgjtq9RxxSPslKrGbHFq21hWnLRaHjXxId7OvjNrerxdbGPv9HT8yyQpJ7
         kqB0FjGqbl8V5cFSFlvT5SRtB2S8G+LvCsSSzUuGqiiJm0akhKHfS4LNbe/IvA4Dihtr
         VrieWpRXQZIsdVNg/m0blhEqZsnrJNqSYhS6d/KD61X6uub5P5j6fZ4YZnjwUnKSmllQ
         aR4gw23BkC2Po65CDVo0MOqXmGsGIejmtXITCliSOF/lGhPGCLEhNkY6T2aNfRrNZhRc
         8TgQ==
X-Gm-Message-State: AO0yUKWPw9kpQB5lpAD3OaJNiTp4clv58gtP+UMmffSc3IthbDSZ+Hds
	pi0Nz/1a6ccMKcxdDzp+rqdOq+AaomBmJjbASNvGT9yIfFmqnLd9ByGDlLITdUhKCHOCY8Vz220
	a08bF/ENdftgwQzS6QSTF3E6demUJE8rizg==
X-Received: by 2002:a05:600c:350f:b0:3ea:d620:57a7 with SMTP id h15-20020a05600c350f00b003ead62057a7mr7666598wmq.8.1678061909913;
        Sun, 05 Mar 2023 16:18:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/9JvXxrghmcn4PyPCxF7TiBqO859FFP2397q34N37jIbzLBHWpzS4OpIqK5Q/y/1AjDFN9aA==
X-Received: by 2002:a05:600c:350f:b0:3ea:d620:57a7 with SMTP id h15-20020a05600c350f00b003ead62057a7mr7666587wmq.8.1678061909586;
        Sun, 05 Mar 2023 16:18:29 -0800 (PST)
Date: Sun, 5 Mar 2023 19:18:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230305191351-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
MIME-Version: 1.0
In-Reply-To: <20230306000302.GA244754@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues

On Sun, Mar 05, 2023 at 07:03:02PM -0500, Stefan Hajnoczi wrote:
> On Sun, Mar 05, 2023 at 04:38:59AM -0500, Michael S. Tsirkin wrote:
> > On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
> > > What happens if a command takes 1 second to complete, is the device
> > > allowed to process the next command from the virtqueue during this time,
> > > possibly completing it before the first command?
> > > 
> > > This requires additional clarification in the spec because "they are
> > > processed by the device in the order in which they are queued" does not
> > > explain whether commands block the virtqueue (in order completion) or
> > > not (out of order completion).
> > 
> > Oh I begin to see. Hmm how does e.g. virtio scsi handle this?
> 
> virtio-scsi, virtio-blk, and NVMe requests may complete out of order.
> Several may be processed by the device at the same time.

Let's say I submit a write followed by read - is read
guaranteed to return an up to date info?

> They rely on multi-queue for abort operations:
> 
> In virtio-scsi the abort requests (VIRTIO_SCSI_T_TMF_ABORT_TASK) are
> sent on the control virtqueue. The the request identifier namespace is
> shared across all virtqueues so it's possible to abort a request that
> was submitted to any command virtqueue.
> 
> NVMe also follows the same design where abort commands are sent on the
> Admin Submission Queue instead of an I/O Submission Queue. It's possible
> to identify NVMe requests by <Submission Queue ID, Command Identifier>.
> 
> virtio-blk doesn't support aborting requests.
> 
> I think the logic behind this design is that if a queue gets stuck
> processing long-running requests, then the device should not be forced
> to perform lookahead in the queue to find abort commands. A separate
> control/admin queue is used for the abort requests.
> 
> Stefan



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

