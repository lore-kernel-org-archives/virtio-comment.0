Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C1139D
	for <virtio-comment@lists.linux.dev>; Mon, 23 Sep 2024 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727061241; cv=none; b=KIzeTHzRZOiZLhHCggyrqQoiyfULT0imUlfWlR8IJ+50G4qiGIw+RXj+v5jI8xin2iZGy1jr3HQ3uvf5P8Hh4UDejA+r7e1P4nDB35gqR2cQhDLj/EAu97xgpmdlMFgSi2C0gZ8fAVkdXUKyDQHhMyijM3Y4olIi6lMxeEZCcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727061241; c=relaxed/simple;
	bh=eUf1esKpi7STo9q/KZw9TmtzavRjSjt4OXdzITgY2S4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWZCI3/zd/KDGTCVyU82P4YG5cxq4PeQXVeOO/Ela/8xl9pxBZ4ES74wGaS1l1J2KnDogYxeV31wc0WPpAoYk6W8yxTEQOnuvwhX1wbflac6xDVsc2veEsoZhiO7Rp3dkD9RkFQ3QIvaLS+PvU7gWCS7UBg90rFJqjPqrSv0VnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1GGYdFm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1GGYdFm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718e285544fso2840488b3a.1
        for <virtio-comment@lists.linux.dev>; Sun, 22 Sep 2024 20:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727061239; x=1727666039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUf1esKpi7STo9q/KZw9TmtzavRjSjt4OXdzITgY2S4=;
        b=h1GGYdFm24xl4U7uLTfh4AxcO3hSeRXR8rkEZgiSrm+ofpnZiNNUAbENKQo6i1EkYn
         qViD97Tf7FhZjh2NBSyQFKpj5EvwPQ0JmZpnNiXv4qj6z0REX6B+6ep0hNmwUtumRY3H
         ArdAQzt2hx6sJJFjDnBqXYaWo4x4976usc/y7CbVg2lc2pNax0hEcBYoydlOXhmxDNsU
         IeSZvfSEVJfc2tJYBNNmQNd3FXcVw0hAiptch9gUrdlb75e326uAgMmdWXhPsIDdou56
         EN3cyc1cthIa4P1qXyob5tFGwBybJZxyiVrve9j2jutBpo1hOY77e+oxaM5XR81dwWEp
         H5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727061239; x=1727666039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUf1esKpi7STo9q/KZw9TmtzavRjSjt4OXdzITgY2S4=;
        b=ahjdt89uluM8t9HppUJdrhgU6Aa1k83bA9tPJwEemUDhGfo3TDLaCr5RNKZfw/VHB5
         2UgZDnTglVidpYYoWfFKrDRxEiCIXxqk6Ze2mSkAPJbuNpUleYllmwA2x8iCS9LgtBym
         SwxabtMmOkayNEnislsuiheaGcO0oP9WZD82c5BGAT60nmlaBeDjVrT5dv6FWk2C6IMK
         pvPyKv5qaBtV1FZ8GF+cc5y2Ok+ZSl7eVqUBO9jJqBH3Lz6iAKcSSWus8m0TC63Bc8ja
         q1myNjrnEmt8pMms9B4hoez5mrdYpWMFoE7ZIu9aA0DpVD9+MgSMirPjBv6Jf/aBmp4K
         VeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZkTKukugOANlkwF9RONNQCEkgZ5byb2qY/Za/lyrWJzz4crO1A0SpoZyE2nSk9sK/MCRhG/0ueFq5U8y5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+kjJ/SvskdYPARnbIvwCKRs4qc70CK/ZDQF7cEzy5suu3V1QC
	JsgTfx24GEcwsh6pjrTEjivHXuRyRmHGZjJzEG8FClRWSvZhI78A
X-Google-Smtp-Source: AGHT+IHM/wkeS0kRHX37c5ck+EfbPVRV9DGUhYsEQA/AN8FiBSHX9168yzbW/fCmTuxTKIpy5WOJ+Q==
X-Received: by 2002:a05:6a20:9f45:b0:1cf:edad:3bc7 with SMTP id adf61e73a8af0-1d30a92680cmr15123833637.7.1727061238958;
        Sun, 22 Sep 2024 20:13:58 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a977basm12986782b3a.4.2024.09.22.20.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 20:13:58 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Mon, 23 Sep 2024 11:13:37 +0800
Message-Id: <20240923031337.1185840-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909085150.461189-1-niuxuewei.nxw@antgroup.com>
References: <20240909085150.461189-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping Stefano.

I need more input from you before we proceed v5. PTAL, thanks!

Regards,
Xuewei
