Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BA619C55E
	for <virtio-comment@lists.linux.dev>; Mon, 30 Dec 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735552485; cv=none; b=oFWhLicBUwG5bFbTaOZ3H+QaMEBa/S7RVWGgjT2GtgrLH1HkQvQwSXLfs2v74RFpWZAV2SrtSrHn1iR7leaAeKD1gRZg0FajGwd2oZSVdyFILulqkMqO/JWTPeBrTpJTkqJOL6GKOKvuBfZoeH6gHARadKP+yy18km+h8HiJbcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735552485; c=relaxed/simple;
	bh=d8bkXyX8kClmYlRXWzfDfiiSX0m+Hbkgx1z9GljP6Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vua45FS3gSbD51bwJCxzmBgZOj9pfjVO+G4caoIGtAaV2KC4zDGo4QCxvgtAwQe2CFPVNzkvIteXtfbsOIHfs9afqtpTwYggNuhiYS/k+dU0CXbSS8z/hw63+x/HcioGO0UVdk5lmcoyriyvdSbNKBUNwmD/gbZSKtTXcxlhEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjnJlcrE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjnJlcrE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163bd70069so14208535ad.0
        for <virtio-comment@lists.linux.dev>; Mon, 30 Dec 2024 01:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735552483; x=1736157283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8bkXyX8kClmYlRXWzfDfiiSX0m+Hbkgx1z9GljP6Vs=;
        b=mjnJlcrEoz7SVXjf1MrvtTvuLimpB36/MJ/u4t48Y5k9/ZzYGwUDfb3GzXBgEzcnZt
         WGiOvB8IWioQWpl3Dy43RI4CFlbhZn0c/OyysiMXnasan/Oyvu1ThqOQM7t6x9fTHkfs
         uCTEmxlk09vrnnijCtyMNmN1LJFMdOYsIEVqgrztvIo05bXlr5wAoq5MRVSK71lWrwXN
         8xMYwdDVAXas1RR8trIX6k4SPyYWdPdOm4/cnV0q3L0bbbtHeQfZ6GqG/RU6l5bKqfB5
         JUlcoIkhPusEL6SyoNtGIg2/glBaBnw3GmyKB6cDh/fiA4KQp/p/V7LRXneJXS86MjnB
         xYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552483; x=1736157283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8bkXyX8kClmYlRXWzfDfiiSX0m+Hbkgx1z9GljP6Vs=;
        b=oxzKyzAQPQdz3YLAkKDPMvkGBUPORY6QjNFtdDPE04qAWHtUbHh3ywpd/ctVRqx8CN
         SrdrgZyc7m3LLdRezHYWLZN8IJUfXqv06b0tSfaLZe+DZPqIHQietJtWdsrb3ZAI0fYU
         sI52t1nSmFlZKJAO/M7I+r0WAV7NHgYbXS+Gerng4xQnXR6DeqpTP38hzc7Eo3ve6Mcd
         SJuxCC0n8CODHs4lOWL477buZVMHbrBUk9Dc6vWc21k9vICuv1Mq6SYhDyynC28xU6jR
         gvuS7eECRB4L6aWCCgRCFPORPKGE/q0yIG/KKyIOEysvYMf9nFPtS4F4THJFzonIcFNO
         Cpfw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EXSZT/CR35MTHh7YLEU1mSPgRIJeFXldM5kWxFn3okxZzrN6pof3uc4uKbMdoHVSCzfHvja6ae3yHbqKwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4HaJ89F5g77nrmFmWr5HuaeNRZLJ1XY1TILCaV3HVGlIcxL3j
	7jZ4/euHIzW8qf6OKUaxWoktTxsspqdrq2BMPSr2ztaFpmlxE1Ul
X-Gm-Gg: ASbGncvzAJrE/wduQ0zjqgCHyoFATwXbmPWtFbFoIl1RLqP4jgKm4kEXePo5pfn1o+K
	9X3YCN8vFMpYvdNI02nXzBuMuZmztAbdKmSsZBvbAiD4k1JcKLOZRTo1Ql7rzpggFJg9ObqBNAO
	s8ZhUBxzKjNlNacqj5Ng17x78G35fTf//aJPbgfg7suprbT7gjsbyjGUAW2aBdxtYsFjrO7lzOq
	PPD4mIxo+2YSUSKvmXBfMedQXtDM6zTw0llcQkU8NbAmbOgCbUiZvZWMF/h2CrcclPV0PzfB8ql
	4Uw=
X-Google-Smtp-Source: AGHT+IHD7CnaOiAh5DqZWCm8RI1mWU4nQYJfsCQAYgOnXeV/Wit6w0Xd1m8B7G5zagEy3IVWOIrl9A==
X-Received: by 2002:a05:6a00:808f:b0:724:59e0:5d22 with SMTP id d2e1a72fcca58-72abdebb934mr56998240b3a.20.1735552482957;
        Mon, 30 Dec 2024 01:54:42 -0800 (PST)
Received: from devant.antgroup-inc.local ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72af8dcff60sm10050972b3a.152.2024.12.30.01.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:54:42 -0800 (PST)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v5] virtio-vsock: Add support for multi devices
Date: Mon, 30 Dec 2024 17:54:33 +0800
Message-Id: <20241230095433.830924-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
References: <20241205062908.4193685-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping Parav. I'd appreciate it if you can give me some feedback on this.

Thanks,
Xuewei
