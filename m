Return-Path: <virtio-comment-return-4951-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C03DC6FD20
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 21:32:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A7C42A89E
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 21:32:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3035298644C
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 21:32:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 283F098643D; Tue, 21 Mar 2023 21:32:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1730998643E
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 21:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6gMpKYVhN3iaHuBFeOVZPg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679434348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV4bKCFB5hnhtm38s9fF5Wde6nY5XGm/Cz9c/vv7ysE=;
        b=L85zrnUBU6ArtLO/gD847T9t8u1ydfpcE0Gwh5qXkFQAcycqCXIlJli20P7zGSKeRu
         DN97PduQUNP8JExE130V+7aPQnxvwIPqKWposmHaZUVXRMe66BYfQXJOh716a0DQk0u2
         Zi8X3dQoThBXAMtGXto63O81e0jubis6engcpsaZI3C734FXsrTRsqKyCJ/LfAMCGixn
         rsnmhO2/7VZV6icPumHxIy7wutzcd34qyHesI72RRtvmi+XuMhRRSFWgD97bX61yOiTy
         k9RBeaFZBMGk/8xnaF/8kX4JXAxWdtLKKFFbRhSdq2AkG8MOeRSQigO9j7x9ulkjFP9I
         Vpcg==
X-Gm-Message-State: AO0yUKWVkkYog31NSsS9ZD/01cVyKWri0wyND4pgWK9OwiV+OA4VVyqp
	mXjIiNTpwDlUVVuYwFBGKyEg+Iljp+r6BYmsgFXOR/J1COpiONesHOIctDUF/fSJi2O7CoLMJgH
	waez1e+rnkGagBHVHiCxn4RGqsTCttX6YOA==
X-Received: by 2002:a5d:4ec9:0:b0:2cb:9d29:7242 with SMTP id s9-20020a5d4ec9000000b002cb9d297242mr3295599wrv.27.1679434347885;
        Tue, 21 Mar 2023 14:32:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set88MAlxpGygTW+c2RgPbWOCZzBR+QkUyKnP83OcLMGbSZo5R/PgeBClfw8FslQL9LPa2hd9OQ==
X-Received: by 2002:a5d:4ec9:0:b0:2cb:9d29:7242 with SMTP id s9-20020a5d4ec9000000b002cb9d297242mr3295589wrv.27.1679434347585;
        Tue, 21 Mar 2023 14:32:27 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:32:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230321172742-mutt-send-email-mst@kernel.org>
References: <20230320111840.64039-1-hengqi@linux.alibaba.com>
 <20230320144625-mutt-send-email-mst@kernel.org>
 <3a1969e7-2c4d-b64e-33b2-57311d73fb45@linux.alibaba.com>
 <PH0PR12MB5481C6A8454381F508A30387DC819@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230321033449-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815C3FF78C1702B714172CDC819@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815C3FF78C1702B714172CDC819@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v11] virtio-net: support inner header
 hash

On Tue, Mar 21, 2023 at 07:46:14PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, March 21, 2023 3:37 AM
> > 
> > On Tue, Mar 21, 2023 at 04:19:17AM +0000, Parav Pandit wrote:
> > > One (this proposal) is solving spread to different RSS queues.
> > 
> > Spread is mostly ok with modern protocols though. 
> Yes. 
> > It seems to optimize for a specific monitoring solution.
> > 
> Monitoring is a critical part of the infrastructure.
> So, if a point solution is useful, at least I don't see a negative of it especially when there is a user of it.


Yes. I'd like to include just the protocols that genuinely benefit
though, so we can avoid the churn of adding more and more tunneling
protocols as they appear.

That's why I am trying to find out whether limiting this to
just classic GRE is ok (and maybe GRE IPv6).

I also feel if symmetry is needed we need support for xor based thing
with a mask, playing with toeplitz is fragile due to e.g. IPv4/IPv6
headers being different length.

> > > Another one is finding out which exact packet to drop/pass when queue usage
> > is high. (ebpf/tc other ways to solve it).
> > >
> > > Ebpf sounds cooler than the real offload implementation in the hw device at
> > the current level.
> > > I remember Jason's good talk on the ebpf a few years back, which is possible
> > when done in sw on the hypervisor.
> > 
> > I was talking about classic bpf though. no state.
> > 
> Packet processing logic requires to keep track of past tunnel data and counters across many queues for fairness.
> This involves stateful ness of past/current data.
> 
> Even with outer header entropy, multiple tunnels can steer to a small set of queues, because num_tunnel >= num_queues.
> Hence, fairness is orthogonal.

Yes I was not talking about fairness. that was addressed adequately with
a security note I feel.

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

