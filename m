Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516226A09A
	for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959439; cv=none; b=BJvlG34VMIzBShKPBs/cCxq6aD+hocqjQV2WGZH38ujJtTlr0NcW0vyAIapfjPxSpq5rW1TL2USN9iFvFSoOGsPvxDSaa4slzxt9orsDGzJhYi3O5Cs8XkcZSDBvtc1idU/v9Fb+PXRiGGFIyt42I9aRHOzxY1bqTitp80vg/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959439; c=relaxed/simple;
	bh=vRkEcrMnSbDZVpq+QMiTdBSP2qjSd2ugoPQSsJPdHUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KSRl/hnZXyPmB0Nr/3u2FwpJQfdSZspT4K1sG5cPDZNrG0nyG76nrtrqgIIHPRTT8caSCKGqHcqCI3EpIJJCUPUOBfvuv/FSxeHWQR6p5EIhDZKXBTwrxNROVIWSoGhK3LDR8HxLJq7EY8v8ELtiDhiIH67nviQUZMM2rn5YUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpfdAJbS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpfdAJbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745959435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mczGlp3GJdGLIv6/6RLsDu1y7lJrLB4HJFhNDD1DS8g=;
	b=OpfdAJbSM/mUN8cPg2KyXOpraDq7x+SSOlsxh9ydBD0l5f2ca9wl3cIagABYWHkMV+Iiy9
	IIIyc8jn9vP530tSdoYH6qj2sve82oCYTztRzqBrWpSpPR2yuhKa0vQTmRs6zVXDPIY3oe
	73L1aF2x7itBp/2CQgcNEye1Cq7QVjw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-MmoO0YOiM2e-YFbwUKAUQA-1; Tue, 29 Apr 2025 16:43:54 -0400
X-MC-Unique: MmoO0YOiM2e-YFbwUKAUQA-1
X-Mimecast-MFC-AGG-ID: MmoO0YOiM2e-YFbwUKAUQA_1745959433
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso1073545e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 13:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745959433; x=1746564233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mczGlp3GJdGLIv6/6RLsDu1y7lJrLB4HJFhNDD1DS8g=;
        b=pHXJqandcZD9EC3C+9PODenvPTRCGMwI65ctlF5LOiHJnjv1I+rDYexPqhO8ltf1Bk
         t+NgPQ16qn4AyY96UZLz7xsxLwXTJzXjBbnTCxO9nziegwj8XpWWV7bYUEtQOLjSxCBD
         3kH59VEpoTx96yn9YJBCFmu5E79Scg1nLXpkLMk7UrB0JUG14Qv1zqTbP4ukwMHp9j8Q
         df3+PBlfdsiSiPI59n/+cmhqqdE3HD1I9RxvLeSLMlPvG6KD3SlbJ0IR59pYzqusmWbN
         2rugErh+Knfd7VYgcEYKiCA+SPrVzy8Bkt0TXtcBAt0WBnYbwd9wjmfPc8TkNzcpPOYo
         vCIg==
X-Forwarded-Encrypted: i=1; AJvYcCUXCVGSfinmmf8kzhmYhGiRCDIpYuz5yuN5TKDTQvP9yS/8qqQBkoW13oDkw3fLAv+6/SUqa65+L+tGP0Kcxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhlXzz3EWxHL+u9saXlCw9c4yO/mOCGM3qIBCoqedV2eIwmt1B
	RHTuZ3Thq1HPTE7sH6EzgDV/1a/tXM1G74h7W+RvDbGsBPjwG3YatrMhoyZAxQZDdEHxQW3Rom6
	A71PR5zyCUXaonI0RNuDKvVUIhzSEWd7YHZqceg8wB5HrBn/QVfUS8gtF7J3tktfJ
X-Gm-Gg: ASbGnctY90n2DaxZV3Vt8KjLllSVA+AiyAH2GFRr5Z1Qleqyud656fIYGA5r8dYL697
	8knMmIJSTDSpFW8rDo8EaD4nkne1uTMK51lbJZ3pkCFgHzIaO4sqsL4qF1v7qmlnBhdAU0ljNe0
	XMoMHG7UGDT8yaQjKoa30Gtpr/t640NuzO1cdt6cW6R2VmDtnKu4CS9U+/zdBfuMX5HF01K2ZIu
	UqOmPOs6m0L1mRDxrVJeqrxpDrsjEUsQQw6RC2nnYT6TiFCCOlKJcfI6qCjmOd42EYY8ht80uou
	w1TJJA==
X-Received: by 2002:a05:600c:4e52:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441b23fdef4mr1999055e9.12.1745959433065;
        Tue, 29 Apr 2025 13:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkvZfsZ+PDTY3kPFNFfVtdrxFeWO1SRv7OAYw1e5CUIsVeZai4HDoorlxV4XFPFaFv9jLW0Q==
X-Received: by 2002:a05:600c:4e52:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441b23fdef4mr1998935e9.12.1745959432679;
        Tue, 29 Apr 2025 13:43:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aed199sm71665e9.14.2025.04.29.13.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:43:51 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:43:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, mvaralar@redhat.com,
	Jason Wang <jasowang@redhat.com>, shahafs@nvidia.com,
	Willem de Bruijn <willemb@google.com>,
	Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250429164256-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kScWDSZzbtBph3XinMQU8G-xy22DD_WjxqvNdOAbcQU_1745959433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:
> On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
> > On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
> >> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>> I'm afraid we'll have to bite the bullet.
> >>
> >> One other issue with bits > 63 is that the vhost-user protocol
> >> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES messages use u64
> >> to represent the features, so vhost-user-net devices can't query or
> >> enable these features. vhost-user is outside the scope of the virtio
> >> spec, though, and I think it's reasonable to extend the protocol to
> >> enable high feature bits rather than avoiding them forever.
> > 
> > Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make VHOST_USER_GET_FEATURES
> > return two u64s, or even a new message returning an array.
> 
> I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command
> will need some clarification, as in the current text looks a bit
> inconsistent:
> 
> """
> // in Offloads State Configuration / Setting Offloads State:
> 
> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> 
> // ...
> 
> The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads configuration.
> 
> le64 value passed as command data is a bitmask, bits set define
> offloads to be enabled, bits cleared - offloads to be disabled.
> 
> There is a corresponding device feature for each offload. Upon feature
> negotiation corresponding offload gets enabled to preserve backward
> compatibility
> """
> 
> The "corresponding device feature" has the same numerical value of the
> selected offloads, except for UDP tunnels related one (which are mapped
> to bits corresponding to reserved features).
> 
> It's unclear to me which should be the better way to address this
> inconsistency.
> 
> /P


Parav, what's your take here? Given your change broke
VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?

-- 
MST

