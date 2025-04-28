Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05900111AD
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830038; cv=none; b=W3VwSYf340LJ5hRrDh6VppXiGpk7H4O1oyTrSQdjLOOz2Clh/H1TxVZA3K67vR6ygiTIg/3e0qc5TRRRQObRh1/ABS5LCRQ4iTpNTk/ZKdW5Aq/s6laevFWEJOrB+FmS058ns64hMrkkfpldgF4gK1FTpeU0NkofqGaK6p7uQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830038; c=relaxed/simple;
	bh=Zy0ZQvIeuUjDUUjf47PS4a4SGGdXRV5noQbvadCh8Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Oxy2f06knYA5R11phUdBLjI/exJktbKmgWOul9eLNi4kEJpDjvuTLjHO+U8GH2dBAbzMpg1oMHdeycUGm5za9OoO9PYD19oQRHayJhB2qU0M1vREw6FjS83Zc3fGLsmGo2J2/SbV3F8RYZXOPXR+C922p5VVq/NKecnDEcAUYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyhNgXxS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyhNgXxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745830034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VM4JwCgQjM1APH9J8NGV/N3k3QnPW6xsiF0N9lkcp+w=;
	b=eyhNgXxSNfGK0zRqYFePLwZ5So+jTW86k+atCU7VHBImMmWjO4cQGUcJRZUtGJ4O49tzYY
	fCl9CN9d7xyMlXOJPVPvyzIKAp5uEerq2cmTAQtAOHSGgkPu2dCfCZg9QRIOA+v+tj4OG1
	Nk1N7YkIgS0OHMAjyBbLT7gEuC96G/8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-hFaXQnciPfC5a5E0-4uu9g-1; Mon, 28 Apr 2025 04:47:14 -0400
X-MC-Unique: hFaXQnciPfC5a5E0-4uu9g-1
X-Mimecast-MFC-AGG-ID: hFaXQnciPfC5a5E0-4uu9g_1745830033
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d733063cdso27748065e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 01:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745830032; x=1746434832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VM4JwCgQjM1APH9J8NGV/N3k3QnPW6xsiF0N9lkcp+w=;
        b=OxT0/Cf28+EcHiJNtQ3/3+DQIjyc/RavNppKqDr+DlQlCmaSXbKZAgM67kKk2K+nuS
         pTLPWNZmQbbLoWprxikafzYHB2qjydJsIT3YSYu157o1xyS99hVaXfz51vhkH5wCsNKj
         WBZOWz47847ZrKY3Mv7iyZfIAZW32mGpkfnzjsWKOTsHabhW0alhR6t3Urp8f6ozNynP
         g9SgJPiJuErOMD15wENhsNJGfsAxNK7qbYF8pjW0lU8rIlIOWkXAptvjiIW31CvA5zbk
         8fN/M2ov9AfmVSeHunaBJi+cAz1SI02xfOVZq1t+rxatYJ89h/Iv8mPxRcwwRzBxQffS
         ft3A==
X-Forwarded-Encrypted: i=1; AJvYcCUy7AVJrg9axcGs+iaXkBhFn8EOfMvRSJpN+m0R4o7MnaZsCNm2Gov/Ti4lH8qToss/jDchzdYYW6eRZYCmBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp09vrSMnfWTpsgPHC8wkcG7sPQcAgQF12Y0UdFf1iyK6twt0P
	w5XP1XFlZc4s/9BhRYAHRJofPFgtvc0hxkVVA+d+nDzy1lmMv3R/D8Rwu/IEDBuWo0Q2JNRv/fr
	cUCBeuPPDBGfdVw/VJuC5Wlv09IMkYNph+WcaECF9H003Nv/hWSglQeYAp+ivzPJtHdBA3dyc
X-Gm-Gg: ASbGncv4gYUBuedNJ/vz4hTFy706ORolFbbGSm+DOikquT7qwoMWrWlGK31M12ZaGsx
	DhDxIXEEWcDSJKxw0oBYDC9v1rvkGfMfBjba1TGgIltxtadhlGPi0wY+91wTcqt+20TVjsToVTG
	FbFinEl5oAvitv4HUPUZaxgSOsf3D+TsQZAw6ubq8X6STFJwpGjKAck/xSY9/GyBj0efAnm7xrd
	useAw26N87s/gS6UjHqZom9po9pk3twHGMZGz4xkFZxJoSB7EJ19BY4HK5XxVG/3rKd6p913k2z
	lKyA3A==
X-Received: by 2002:a05:6000:cc4:b0:3a0:6fe0:948c with SMTP id ffacd0b85a97d-3a074e3c0e1mr6639697f8f.30.1745830031997;
        Mon, 28 Apr 2025 01:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExF2cChcS2JisIpKQUJRjwHAnDcTXIA0TerFR4SAUyX+68o674pEDxgoYmgV0wXnGhyE4DwQ==
X-Received: by 2002:a05:6000:cc4:b0:3a0:6fe0:948c with SMTP id ffacd0b85a97d-3a074e3c0e1mr6639681f8f.30.1745830031685;
        Mon, 28 Apr 2025 01:47:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf04dsm10636603f8f.52.2025.04.28.01.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 01:47:11 -0700 (PDT)
Date: Mon, 28 Apr 2025 04:47:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, mvaralar@redhat.com,
	Jason Wang <jasowang@redhat.com>, shahafs@nvidia.com,
	Willem de Bruijn <willemb@google.com>,
	Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250428044458-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: FMVEdVgeGONfjhJBXGt_cK7VqZn8ekN3fXLh3C-rZTc_1745830033
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

Could you pls explain what is inconsistent?

-- 
MST

