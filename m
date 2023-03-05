Return-Path: <virtio-comment-return-4681-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6117C6FA8E
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:39:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FD57676E3
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:39:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED61D98638B
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Mar 2023 09:39:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD99798638A; Sun,  5 Mar 2023 09:39:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAC33986395
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Mar 2023 09:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XyYYCsAhPSC5Yp-eYe5DXw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678009144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N048sCiPa8dCvUtJZqJRm0pckfHsh/MfhrWWCO1+AcQ=;
        b=EAIi44MKMfyWoqaWHnnKxg0tpEZR9RRKMltT9JjU0tFbF/Hmxe723Cjki6lInu3lW3
         Q97dHoWkxXrZOj2qICSo+mLUyhMwOxXGffcGacCCfMhQU0J8/Xmbgtdwaw/JodPf0v5u
         aUnuLgAXfa7T7a/Px4NuYyvyYIsezGCWSmWSHQhyF5UdWc6Dw+lz1Hw83lHeF9vfF6ch
         icbkKMETu7dXMr90k5Wd6om4r7bblpyxRVf2tC2+q8miKXNFLoyh8GzrVPFuIcgkEanj
         As+l1inRaUNmCIcR10ZHqb0RSrmo+GFGrm7hjMFtNh4J8ongvqnK8WmhmqtLZmK9wFiT
         WhhA==
X-Gm-Message-State: AO0yUKVLWJAc/nS6mzygyS+6tXKCAUkFfHjAhq7EKNPmgIW3nXsBWehC
	wuR3p7dfQwrWdQ58avvxYk8N6AK2FQGrnE65XqUKQ3ZQKNa68nT3jnfvqo7ngiwPonrnom5u9hl
	4xQ46fdU4CWP936DxWhxyATaQTLWzQegumg==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr5188946wrv.47.1678009144502;
        Sun, 05 Mar 2023 01:39:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9sZcDf0HY83s9267Uclwt4GG0Hq4RlXJVeKy6Gh2F4hEyS8V/MV/CgT++2Vb4DDivTr3TLiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr5188927wrv.47.1678009144251;
        Sun, 05 Mar 2023 01:39:04 -0800 (PST)
Date: Sun, 5 Mar 2023 04:38:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230305043419-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
MIME-Version: 1.0
In-Reply-To: <20230303202133.GA2901137@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin: introduce virtio admin
 virtqueues

On Fri, Mar 03, 2023 at 03:21:33PM -0500, Stefan Hajnoczi wrote:
> What happens if a command takes 1 second to complete, is the device
> allowed to process the next command from the virtqueue during this time,
> possibly completing it before the first command?
> 
> This requires additional clarification in the spec because "they are
> processed by the device in the order in which they are queued" does not
> explain whether commands block the virtqueue (in order completion) or
> not (out of order completion).

Oh I begin to see. Hmm how does e.g. virtio scsi handle this?

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

