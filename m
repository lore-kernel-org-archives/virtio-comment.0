Return-Path: <virtio-comment-return-4714-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A716BC61DA4
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:37:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D763C73188
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:37:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFACF9866BF
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Mar 2023 18:37:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD23A9866BD; Mon,  6 Mar 2023 18:37:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B5DE9866BE
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Mar 2023 18:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kflAYXMNNDes2OTexIfCIA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678127856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUWErxNPrUrIMv2QbGRSFvzl2G28V2kvcbsO7YO7Kg0=;
        b=XtYOD3JnLIGck5CUaBhqwXEf4JAmK0edLNBuPpkgNTgxkXoQzUe//sAUBdjF6/8/Je
         Q/TYHyV5mmXE9rWdWnYgTbVO9iWqm8psX5brfEuMcLPe5fKNB2zXB1Q+HY1RGYJFROTe
         Y2gybwm0ZLISXynbCiRkTuhXvQj3BlJKxG1/hLK4xpOm8GyFfP3NlUz7e+gqnZOF7Q7V
         PG/ITmxQCR+e3onbseC4TK1VY0K5VwM+MozGVxgh3OE9GwwzYgKOhrZ1teAriBH7aEFR
         o9oKdqApSm1rAa9a9dC2+ggCmg21DHSswvinOkQfhmwEtLy0HsxOEpC5BfQHmhFFch3r
         lDoQ==
X-Gm-Message-State: AO0yUKXZenazNkyHbuOYPKEK4hn895RLTh5DfyAaymwSEVEl8CurvAO5
	jn8qlVD68G/iREbWUkFp+H5TtIKq2Tb++VRq9uhNQ99PFBPQrIfomuB+D85QrzOrZ251v1q7F0S
	OAVb2FUbmBpn3HHUL6bujX2Z5zuZKR6yMCA==
X-Received: by 2002:a05:600c:3b0c:b0:3eb:2b88:999f with SMTP id m12-20020a05600c3b0c00b003eb2b88999fmr9887591wms.5.1678127856110;
        Mon, 06 Mar 2023 10:37:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+pfueUoTftA7cCbkxlmh7uF0V/CpSd6IjoWMj0zckWOgYt3Z+Ok+5HFp4Hrghly0Ye4rD4WA==
X-Received: by 2002:a05:600c:3b0c:b0:3eb:2b88:999f with SMTP id m12-20020a05600c3b0c00b003eb2b88999fmr9887577wms.5.1678127855839;
        Mon, 06 Mar 2023 10:37:35 -0800 (PST)
Date: Mon, 6 Mar 2023 13:37:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230306133525-mutt-send-email-mst@kernel.org>
References: <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <20230305191351-mutt-send-email-mst@kernel.org>
 <20230306110340.GA35392@fedora>
MIME-Version: 1.0
In-Reply-To: <20230306110340.GA35392@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues

On Mon, Mar 06, 2023 at 06:03:40AM -0500, Stefan Hajnoczi wrote:
> On Sun, Mar 05, 2023 at 07:18:24PM -0500, Michael S. Tsirkin wrote:
> > On Sun, Mar 05, 2023 at 07:03:02PM -0500, Stefan Hajnoczi wrote:
> > > On Sun, Mar 05, 2023 at 04:38:59AM -0500, Michael S. Tsirkin wrote:
> > > > On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
> > > > > What happens if a command takes 1 second to complete, is the device
> > > > > allowed to process the next command from the virtqueue during this time,
> > > > > possibly completing it before the first command?
> > > > > 
> > > > > This requires additional clarification in the spec because "they are
> > > > > processed by the device in the order in which they are queued" does not
> > > > > explain whether commands block the virtqueue (in order completion) or
> > > > > not (out of order completion).
> > > > 
> > > > Oh I begin to see. Hmm how does e.g. virtio scsi handle this?
> > > 
> > > virtio-scsi, virtio-blk, and NVMe requests may complete out of order.
> > > Several may be processed by the device at the same time.
> > 
> > Let's say I submit a write followed by read - is read
> > guaranteed to return an up to date info?
> 
> In general, no. The driver must wait for the write completion before
> submitting the read if it wants consistency.
> 
> Stefan

I see.  I think it's a good design to follow then.

I'll just copy
	The driver queues requests to an arbitrary request queue, and
	they are used by the device on that same queue. It is the
	responsibility of the driver to ensure strict request ordering
	for commands placed on different queues, because they will be
	consumed with no order constraints.

replacing "request" with "admin".

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

