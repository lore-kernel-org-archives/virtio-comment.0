Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D07DDC3
	for <virtio-comment@lists.linux.dev>; Sat, 12 Apr 2025 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468704; cv=none; b=hBQ7BodAoZbcHiGT1liyxIwbqSYmnUuH+GivuGLVTg11dcaYgJCoLQnw9kqtXZ6DJNZ2DHCi1KN9sLvEsUe03md/QZKsS5bkHKsnHWzWU414GjSPrArH3G97auiDxFKKsUKHRdtzVy8fSo1eMOl5UC/pHAiwB+OHHwHAf0UI/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468704; c=relaxed/simple;
	bh=66o5C6lPAld4X2YZ2nM24FQfJHVoiYB0GheVn3fGB3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tfOttzoHuythYJe4bi5mL6uv+gaNLmxXzmZy3aM1XGxfZLI+VSAyc0OyXPRJ2K6Edm6pTbcO2kPfT/lsukOvjznsFAXo9hXDH4qrLqbvqCRNKSq+VHL2OzgTsw42kyf6wwjB62KdRpc4ucAvQH0teZeYdL6X8jHJPGrsgz14iho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsOYqwmv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsOYqwmv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b350a22cso2502200b3a.1
        for <virtio-comment@lists.linux.dev>; Sat, 12 Apr 2025 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744468703; x=1745073503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66o5C6lPAld4X2YZ2nM24FQfJHVoiYB0GheVn3fGB3A=;
        b=YsOYqwmv1BUbbkd9kOELZN3kqzKo0O7viArVzgMt9w4W3Cuv2LKzWxWHU01dp3/wuK
         nq6ynz76isFpyQYnK040qxeVuKiMdQmZc3Oeaz9z0LM7EdsI3YRquDu00Awf/w90Dp4O
         UeuSYJHubjSlPPpMwaFWovcr5vI7gm4RGGLw48m6D71xUIbTqdAAVerLHnmOzJ7krR7x
         nzeoTQFnfzKO1x6Jhf5h3XxxNltLo62TJHHd14hrZdSXnMb91ov7LDk96IpBEKefTSzT
         1G+1I21L2xdD02A9VtAGgzyakHnonT1OrBzX1epVpEe8LXatwUfxoGS6awiluEtgf2BU
         lkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468703; x=1745073503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66o5C6lPAld4X2YZ2nM24FQfJHVoiYB0GheVn3fGB3A=;
        b=xBb7Y+xLJfrcdqDfXo98A3uR6n530mUyZ3rKojOUrWUGP5PzBcmG2PO4cgh6/5NIAt
         85+88OsnED2skPF4KDmo4GYjYKl8JU+XXya4V0KdNjsHYNPuZgke6igtBTnrDzJFAZp7
         On9YkyWjBvARo2m02KKMjHD08AKxUbVY3iMsLGSPzgWCOHsx3GYh+sn87sIHRCod3rSb
         dOv2jDDmoPSU5FE6XdGq21KH8CRehluKgj5aPdADPQyRVGrOqSFsl7eDQXFPCMD+IXRS
         oUzHvFmaMrwyoz5kruGU+Uq1b2YslmH/sstgNMrmBD/l7HOAIRW75rwgVS5KVM/Uc0eh
         puZw==
X-Forwarded-Encrypted: i=1; AJvYcCUHVQf6BFeVZGj6j49xFPq+sqyJxAat2Nq3nS4K4vE0bFOIql5SPJ+2lFLA4eR2ltpi+pSioglMr8pwkF+4rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvEBo6ynFog0zSL4N39h33OpIcYj3rHqk6xwYqTKhdiKzRMHlT
	6wIJd4f2UrjsuZZ3LItGsCBOZ9zqn0cZC6xUT1Mta4A3qOX6DhD39BMPqx5fMpYyYA==
X-Gm-Gg: ASbGncuIsig2Kv33M/cA+wsfZeI0FPI85pQbqlJPZrkbe0rHUvs82h6ya/oTuQ322Pg
	DGePmDmtKo2MQ2wrRDfawWq4/nKZycZU3+k1AkGDKRmJ9ebuYnhSaoCAVNtH5GZ+1NHJa3mhX8N
	fA2yLJjgtqqCc56Tkq38lExVIwvoMe26/2zt5Hd/kgRqMnOEB5OmBLVHFgm6qNjhOOKaKK91WeC
	zDhsCqyUHULhwCJF/sl6J13CpritzWfPV81z6CV2SYjb1iGV7kzcNkNO1rNPaqd4V8Gz9B00I0s
	A9mYGXMyvJYWYKnRzy2ksuvedngI+J6onux7qEtgS8P4qkBZ6LLEWv4hYJatdGk=
X-Google-Smtp-Source: AGHT+IGYElnv39ety6MjQjqhR6Tbr+bHa3F0wK204ClYNnOPuighXtHkr4mY2wBBHHujBnQjXxo7lg==
X-Received: by 2002:a05:6a00:240d:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bd0ea5de9mr8251073b3a.0.1744468702529;
        Sat, 12 Apr 2025 07:38:22 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f8850sm3437315b3a.87.2025.04.12.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:38:22 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Sat, 12 Apr 2025 22:38:14 +0800
Message-Id: <20250412143814.3182441-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
References: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I would not merge the feature of VMADDR_CID_HYPERVISOR support into this
patch, because the feature depends on this multi-devices feature. It will
take a long time to rework on this patch. I prefer to file a new patch
after this one gets merged.

Thanks,
Xuewei
