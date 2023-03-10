Return-Path: <virtio-comment-return-4864-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6929C64EC4
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Mar 2023 09:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B490041A1B
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Mar 2023 09:35:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A90A986733
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Mar 2023 09:35:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7584E98671E; Fri, 10 Mar 2023 09:35:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 227AF98671A
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Mar 2023 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RdyI9eRAMSqdgEXtQA8z7A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678440891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLHMD5ZXRbqYy9eEZmCJWU9/VAo9vc1q6KOPYRWiIuM=;
        b=OL7VLGtdWisVqZAXcD3lGmIWqUNAturNFncuV3PMqoe6AvvOcuIXdBROFan7GNwhx8
         hVipzy6IHcdJseL5X15aea/IGD21WKlX2uDjAulsHrDskBX9Eqam+Wdm9SDYL/139bkj
         3m5OattQYRBdZq0gnaFuVsaEIyAL4k4OReHO1FRIdjrAvlL2yng3j5tlICteK1rsFWdZ
         q/ubAqFrDK+qvO9QJQk54D3VPP2d0+ZO0Rz2HkMAkJ/HtZV0TJ4Pa9hqrJc3WHb6U1y8
         7w85qyux1/59QTjeGh6TGWlIxdiceslY86MTl2GQzY4tIf55fALUwZTl096SfQSPNxS2
         DNUw==
X-Gm-Message-State: AO0yUKV1+Nc+GQ9Yw3CmkZf7qRDG/AxETUsbFdFXAbpLj8edHDXwD50z
	Qo5xuXZftj18ByMXQs4ntqAMia0lDweSWlhLQ1KRkA9esjtjMX2Y0eqpUwNKGt4HzylfL+djmee
	ZleJPA6+E8rlH55YOkQFw5AUmvCLBHJ0reA==
X-Received: by 2002:adf:e6cc:0:b0:2ca:de61:b234 with SMTP id y12-20020adfe6cc000000b002cade61b234mr12468401wrm.51.1678440891354;
        Fri, 10 Mar 2023 01:34:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+UJIj0pyEhEVP+6VFxuSq6m+d7yMAiJGD0iHNg0QuQVynLk2CZn/avrynf7J7KD9duS0N6hA==
X-Received: by 2002:adf:e6cc:0:b0:2ca:de61:b234 with SMTP id y12-20020adfe6cc000000b002cade61b234mr12468273wrm.51.1678440887238;
        Fri, 10 Mar 2023 01:34:47 -0800 (PST)
Date: Fri, 10 Mar 2023 04:34:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230310043230-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <6677477d48dfc234d3d1a339fb39d8fa2a3b983d.1677761896.git.mst@redhat.com>
 <f37a5993-1349-75ac-1928-beafa98fc068@intel.com>
MIME-Version: 1.0
In-Reply-To: <f37a5993-1349-75ac-1928-beafa98fc068@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 09/10] admin: conformance clauses

On Fri, Mar 10, 2023 at 05:10:48PM +0800, Zhu, Lingshan wrote:
> > +The list of supported commands MUST NOT shrink (but MAY expand):
> > +after reporting a given command as supported through
> > +VIRTIO_ADMIN_CMD_LIST_QUERY the device MUST NOT later report it
> > +as unsupported.  Further, after a given set of commands has been
> Can the driver re-negotiate the command list through QUERY/USE
> in flight rather than upon a reset? If not, shall forbid this explicitly?

Probably best to allow this.

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

