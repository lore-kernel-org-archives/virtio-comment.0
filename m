Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683865;
	b=Fs/27wVBFQySXbF7MuNMyNxPvRYspwG9oFuSSkk7U4ZdPLhVtjmiYqaqcSmPL6PhgmKi
	 TareyeEGfHhln1lda4JfZDkjnUdAObgPbdXvpXJAtGkEgm03jLgaUF5hcqBkesUbmfjqy
	 8mxkUOSpMYDAADOMQhZNbJ07yMiI9p2PtmnqG1r3ZiTAPRCW6GJ0sSpa43z5C9EevfJSA
	 N/ksLoak2pq4NKysW7zuZ3Qlnjpo/65NZSUPSqXR/Uine8dXP2CNQnna4aR6cvgJqpLPz
	 V1920bDbqbv/QR98vNKSnHXkfkcKnz5Ar1miHa5I/M/1wc/KnTdCCHvh4Pl3Ohp2ntw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683865;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=LceWGjv8xeaq4MilmBNnIaUMaWpsqHS2UGzsbG1A8L8=;
	b=39BbR8rWfgaesX32kS+ktJDngaR7lQr3A/LFFXvIRGMIJqj0FS3Z/EWy1EAVhamegHer
	 p0L0n/MTPL2/kGn/G8znz6s0fK1ZFRzs+XCjmdClwbH8Fw+ceRDJujebWIrchtlngMvHL
	 BvwNrJa9Ggtpl6E85Q3C54l20ZlA2HAT4c56/HpR8HclpRP4vToNG2cgJksGQZQNt2J7K
	 PkbJ6FR+LI2MkZoi+FerImaPYm+5T89jCF4MVir/aNZQegvkXsidDQ6pXMiCbuQBJ6BHB
	 1eDWktvvxuGkW38+WJna0NTYvNDgB5BWjWPKuhXZX94H5dq+HLa5cM2y6wsuGy2bKFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ir692IlQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C68606A31A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C68606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ir692IlQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792683863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LceWGjv8xeaq4MilmBNnIaUMaWpsqHS2UGzsbG1A8L8=;
	b=ir692IlQre66zhAUYKZ2yM6nHLt23CAsPNhIDPErFfbQbHGh7jAjNlVnw+hpgbgEJb72Gm
	6QZfgoEShINtzKdHXYH/NcOThcqaCb9eISUdsrOsxYRNoxXiBw7C4+NP+AB4RMQOc05H5S
	gNdw/Lqdrfqk/t+w4hSe4Hve1vMqbhg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-JUSL3qAoMIecA6R2MBT_6w-1; Thu, 22 Oct 2026 11:44:22 -0400
X-MC-Unique: JUSL3qAoMIecA6R2MBT_6w-1
X-Mimecast-MFC-AGG-ID: JUSL3qAoMIecA6R2MBT_6w_1792683861
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1698430f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 08:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683861; x=1793288661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LceWGjv8xeaq4MilmBNnIaUMaWpsqHS2UGzsbG1A8L8=;
        b=fOFmte73K+KiZbDsj0x04nj/lR1vIcQU41PbcK4YP/MnFg1o0HZ3PJZj6uBLiiSxXV
         aPoDOhQCb4BuJLWXRkyLvWC54du9suty26PikPtZ0JQDQxM7XbvkiGpnqOthfXEWa3up
         GhTIg8SS0UA4c7o6DST1J96yK95n1XzYZVpoSvHiaiZQCQX8hTStEH9MVpVIJOjYV9wb
         mLD71Gmzh/AN2oBhGoGIjGQqlXuTJRIG9Slj5F2AAiFxBR74uwsMK76SCKRyXTUAvhbP
         Bh9gHD8FEyLosMdesDIijJr6Pewvb2Ldw35YrDZKrMWIAc+tyehkubXBHh1dVktb6qAT
         pl0w==
X-Forwarded-Encrypted: i=1; AKwUvBzlGnf5rbT2oSW/8oWWtzZpG7ozfkmzLM1lffE7jFik9f+teOQ1r1EvnuT99gQSOK/Jh9Omh+3VSfGz2FkAHw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJNRueUeFY+EyCiPLpfUEk5dYLcI+o8tu5fWmDRy3YG3CwyTGZX
	QGKD/VobvFn86/IFmABvRK9zkLvYNlsxuvQuF/dOqWpdpYDMA4J5y4e6ki3nsNj05iCMaHhKoHQ
	yzdv5K6w4gFqt/4yzODPpzBqmhr4K6a7zaFSP1GtqGR4CGtPaCRQ4v6gK+mb3vslK9U1R
X-Gm-Gg: AYBFou1AEta42WiN0WBaGrrcZGxdCBbgHAi4Ankfwspnt6YFlxFm4s+ocBbzB/A+oLX
	5CP8hAIyiQ1qWj35TOVgaY+1diQolWOI8mvb80hMU+AXQ/aqhr5zILTH0sLA571Yv0j13XdrVHK
	vyXDtYs0O0N3TcW/BVoRsZ6rXgFf7hjxjecQx81QBRvgG65jMe7fWYLUE/b4z/IyjL04Oo+c9h2
	NyuaXFnj3GgtWWcBEOuXrwKLEA6JVq4EBVqgio3iIjjyttoNe7+8EqKbEIQxohd3I6wtvFQFl4T
	CMPt9E1q1K09tSjV7iPXpf65ZbwWHtw6a6PoKbXOoLBLLMRTf6Kl9NkFfXUtl9blxGQ=
X-Received: by 2002:a05:6000:46d6:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e264b35c9mr8280433f8f.25.1792683860881;
        Thu, 22 Oct 2026 08:44:20 -0700 (PDT)
X-Received: by 2002:a05:6000:46d6:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e264b35c9mr8280408f8f.25.1792683860404;
        Thu, 22 Oct 2026 08:44:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0b1sm13413728f8f.9.2026.10.22.08.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:44:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022114225-mutt-send-email-mst@kernel.org>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L0aRU29jpMFRLbwKbgyPtRuboOZkmitkAfV0cxTOzZw_1792683861
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 05:07:09PM +0300, Dmitry Baryshkov wrote:
> Let's define some standard way for the vendors to declare that this
> device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> block".

That is best, yes. Is this acceptable for Qualcomm? You will be
able to make it work with your SOCs?

-- 
MST

