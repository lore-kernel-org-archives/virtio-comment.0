Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB427587C
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658980; cv=none; b=cgxErl2boikw+SFdkyyFmbtR7QXkSXy503CCDtCzw57a8tnZ4199y7IXEwM2xhk24en0tSqDT+OTu6z2xzNxhEO3wIcJe8o4f4b7tTalBep0hBQjzQi47Z7FufWXq5T5hIZ1OAoV4UirIjA30DzVPLvptfJh7eo7Jp+cM1lEsGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658980; c=relaxed/simple;
	bh=wg1gklveplUYDrAfy664zTM2fhkrfvqPRwfNKhRZ1Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HIcwhceUyvbbc9Vm+DkSarHZxUxyhXs4/yuvbLUmofSOKZORbpIUrJoLSfZ0yzIeG43xWazmYZRSxSR0DBtfUYT2ErLj/pYG36+pt89jbNYaG0MwojjopzQNZUzwNy9d6ct/2a2Ugiu8ubcH9ktrCcEJpSLhUq8nW0OymVr42w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxYWKszx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxYWKszx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747658975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMMpvv1UajA7PXkAeeJM3Y5YmQSHx36XM18aLEm85Hw=;
	b=CxYWKszxNOUGEbf+VgUWyCu8rNbZa5UqbjCwdyHKzvbdnVHYKLspny/8k8CnUrDbC435nX
	dqpxR4jp0D99iLpCs1qWYY+dmSoqVMF9YCK3CS3MkVMWcfcji0j68h+/EQVfyWFuGSQ25j
	fgBuyZZcvhwuhBal8BfKdCdmhRwJXKU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-jaceOQT3NSybl91HKkHBzw-1; Mon, 19 May 2025 08:49:34 -0400
X-MC-Unique: jaceOQT3NSybl91HKkHBzw-1
X-Mimecast-MFC-AGG-ID: jaceOQT3NSybl91HKkHBzw_1747658973
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cd12d151so31727175e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 05:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658973; x=1748263773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMMpvv1UajA7PXkAeeJM3Y5YmQSHx36XM18aLEm85Hw=;
        b=RoqSsbq4Uhswxk1Z2T4G7MJ6mJUlY2CcHE/lszi4/8/oncWFcu7KdH+NT0LmiLeQHP
         +gNN84humyicxmomG0ij8a1toyqXDhPCPZB+jmPo04or7PUiEI98wWUtNYePOyYW3+MI
         65ckP4JNs8Kble/1blI3JAtk3nN1xHgGCbzGMq8U3+qV4W2+XgaSxbOii8tQBBrNsSse
         md4j7Oo2hd+9vyikXRUJRLIL5e34SMZIIbGCp/qyedd0bSkgldtCNYXY+jMzWMd11sof
         LWyIpe2fzU6e9/qwhvezFsyj4DTtlVIPMfxSeOSHaulUxZJth08G6p8w5D6O5IxCBGEg
         +F8w==
X-Gm-Message-State: AOJu0YzAAqE9vDirGTNAPi2CUsjQBxpyDbpWI43IMjVKTTM3OqgX02U+
	xwmL9LMrXsl31f6zZKKeCYnLx5rwXfiJZPkDJMQ7Dij2t5uSDRzQUXqNHalu+Bfa9tGNiLVKm3+
	dwDPlfQZF8EAEJDv4hdEaN9K0WgoNFkJEGBHUNDAeYtlnxCbvfclIIr/MSMlT9boCPIUF
X-Gm-Gg: ASbGnctU8eWxd6+xD3ZWaxtuvDUhQtphi+qpuKmZdhT1LEVkC9FVXCM8xcCcav3srg9
	nxkinZOh5ACvVKwulkg7XrXLp1kLb0RqiA3a+wIttO8KhUSISsftzCKjH4srD6Q4xkKEDT795Lw
	Je0O0+vphRlOf8rEif3Bst2lZWL5olJPMk3o4bCov/b/lZ9HKKrkO0U9rPvxD0rCbrEKoDhw1D5
	2jpvi5o2KrytNDBDgTiTSjrRZYSlI8TZDMptOLxRC/Xkae9A6YCnt2jSOwfib5qWyUDZRb8gpIC
	ypF1Qw==
X-Received: by 2002:a05:600c:524d:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-442fd6607dfmr94319695e9.22.1747658973237;
        Mon, 19 May 2025 05:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNViwI0MheWSbmfT5M5+hvJ2aCOn5EglloTT3zJSkNNHXxdnux3VXzx4fq91PjAD8WsACSdw==
X-Received: by 2002:a05:600c:524d:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-442fd6607dfmr94319505e9.22.1747658972887;
        Mon, 19 May 2025 05:49:32 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdc19sm138144825e9.5.2025.05.19.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:49:32 -0700 (PDT)
Date: Mon, 19 May 2025 08:49:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com,
	cohuck@redhat.com
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
Message-ID: <20250519084856-mutt-send-email-mst@kernel.org>
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
 <c6c9f59f-2960-4155-a984-a5f30586e7f6@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c6c9f59f-2960-4155-a984-a5f30586e7f6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dxJW31JmDM1boC8WXE8mWEH4oxDJ025yJH4xTxTxUgM_1747658973
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 12:21:57PM +0200, Paolo Abeni wrote:
> On 5/19/25 12:12 PM, Paolo Abeni wrote:
> > The guest offloads, as specified by 'Setting Offloads State,' use a
> > 64-bit wide space, while some of the corresponding virtio net features
> > are in the upper 64 bits of a 128-bit wide space.
> > 
> > Clarify the relevant mapping as somewhat implied by the current text.
> > Also rename the offload definitions to avoid referring to different
> > numeric values with the same name in the features table and in the
> > offload table.
> > 
> > Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225
> 
> I would like to ask a vote on this issues, thanks!
> 
> Paolo


Acked-by: Michael S. Tsirkin <mst@redhat.com>

Let's give people a couple of days to review pls.


