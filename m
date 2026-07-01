Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAA2DE6E3
	for <virtio-comment@lists.linux.dev>; Wed,  1 Jul 2026 22:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944379; cv=none; b=bcXJ12TZPocoWY+pBsBQQfSD/tesIrvPSQwXE0yHqP3gBS8W7ZojzPwdBwtcZD28BwTaZ1+GgbI3oEPTHa+sOkWwjZMgSY6Wn6XgOYKtpiJWC4DoNiXFL0nleMA35w689k8IFzR9RKwv493PFmD6yct2HWLzOIjXdTreeqb3UJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944379; c=relaxed/simple;
	bh=X2bYMQ5rX/n6Ta62hdaYrRgMvLczqc1EjdB6NWk10nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E1QpgMLDCHPCCn8ewt/O6D81oRGtUD9+YrxFw7yn3RWQewa3u8fYKI8M9wDEP6xWr9lbT24DSFcGAui3GvCaoKgVbV2ZUd9e8TV1W5OEIOx5l9GOfaHMp+pw8Aw7TTJNS59aBjbU76kG4u1XqGpL1YMt8chtwJKockF94dfoi7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JimvpFLL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JimvpFLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782944376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1WxXgkwk1+7UJ9fFMd9qlrDKXfSA8uTIc2gzNsBIKg=;
	b=JimvpFLL4546bMDZpL5cJBagK7d/zJ6jyDiudE67epzIREKAxpKYyCqJooPzOEDD/+vpXi
	G9Dg+Tn2U1z1xHt74hh07l8Q+L9TuqaNEFydPNA2PBsilrCXFTTGyNpsrhwNrfuxFBmX8W
	zom+J7QcDXhs60qJzHHZszC+HWmsjbg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-J5bbu78gOo-BFTO47ONwGg-1; Wed, 01 Jul 2026 18:19:35 -0400
X-MC-Unique: J5bbu78gOo-BFTO47ONwGg-1
X-Mimecast-MFC-AGG-ID: J5bbu78gOo-BFTO47ONwGg_1782944374
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493bdaf8549so12662875e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 01 Jul 2026 15:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782944374; x=1783549174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1WxXgkwk1+7UJ9fFMd9qlrDKXfSA8uTIc2gzNsBIKg=;
        b=XggQg0gH1r8VkHUP1eCPRUU7QhgPwcJo0JKH47E8RtCroIHldvWFNdI1LyvXOIbglo
         zgJMrTLmeK8XSGjgAEYVTb3a/EtFFObrOx51zG8LbVFxNCGH87x+u8dU8BWnfBBon2UZ
         OwBQT1YYvy9v0DBFJG311ymh8fgOwfd5YQ2ZPA9Toa2TWiBuSfX4RUD7VBbTbPMMqgSc
         YCymw3/mkYRSug7VXPnijitzuaHcXE+IpuNiOs6KBy2Qj79AQEiMj4t9S3ohcJc6uyf0
         E0oc9LfzcAByuVvop8R8sYF/kNLK3NbubODQHRwmYaNA6HPMV1N+55urW1JVTL57zPYR
         V22g==
X-Forwarded-Encrypted: i=1; AFNElJ+Q5H6Nn5C34HWBYen/LZA+eS81seCAGYoMQn/faIphJQXRpzchalF8FR3RpkCJ11t2LZmeD1HEYjvcgjkiwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVGpxF9j41BwIyMydtJNMRxr0rk6hdsT2/E7o+uHfwkU0onVQ9
	JzP3bY9r++t8KVirKceDgDUdsobu3ghVunOK1jBvz6n8xOEFX3Y9OSt9a2F5DO9nVuhBCh5eXLK
	85RczzjkXsY82c05DwllqyzJsvMWDtsGYLqmqhD/AXA8ybB7bFYdnI3jn5+BHQQF/uNTx
X-Gm-Gg: AfdE7ckLte3Z0MV2cyPVgYC0/acP3zIK4OD28dIOArKSQrHmSJDkguDW/8Jnqbs2mlr
	kqZo22hYRl1BCI7Cj/YrMSStZTu8hdjuz6RirfWAZ/0+/3yc6zuLxL5U/OBT80AW4JnAFTf8jer
	U+CAjnpT0JOYN4FwgOBGrj1y4h/m5msXE63S2C2tMwBQ71GrKEAa545nb70qYMgWScUZ35YrCzs
	Z9kUzzYpliyH9Ed1QeQmQIBptt80SG/GgcO1CzjoQQC6IVOsZxDFj5LFbIYE7/tEVgTH1Ur8/x7
	9+aJ9LVrtzoEKuPjCKn+k5lEoIjW9NfWtniKKS9LFUKXoQ8TZPjWc+HgQRhHwsecdYYgzZLJARB
	QkQ60XyOtirV6cO8kFehmCr8k4Ndv06OY
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr65525165e9.15.1782944374234;
        Wed, 01 Jul 2026 15:19:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr65524645e9.15.1782944373578;
        Wed, 01 Jul 2026 15:19:33 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2945sm113091295e9.4.2026.07.01.15.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:19:33 -0700 (PDT)
Date: Wed, 1 Jul 2026 18:19:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	virtio-comment@lists.linux.dev,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
Message-ID: <20260701181854-mutt-send-email-mst@kernel.org>
References: <cover.1781514628.git.bertrand.marquis@arm.com>
 <87ldbuu46o.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ldbuu46o.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hzql-j5dkovQmY7ZSGPhn4LQAnaRjWBcDUhpNR5O46w_1782944374
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 01, 2026 at 04:20:47PM +0100, Alex Bennée wrote:
> Bertrand Marquis <bertrand.marquis@arm.com> writes:
> 
> > This series adds the virtio-msg transport layer.
> >
> > The individuals and organizations involved in this effort have had difficulty in
> > using the existing virtio-transports in various situations and desire to add one
> > more transport that performs its transport layer operations by sending and
> > receiving messages.
> >
> > Implementations of virtio-msg will normally be done in multiple layers:
> > * common / device level
> > * bus level
> 
> If there are no comments how long should we leave it before requesting a vote?

for a new transport,during summer vacation time, I'd give it a lot of
time.

> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

