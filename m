Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2ED446D1
	for <virtio-comment@lists.linux.dev>; Thu, 29 Aug 2024 02:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724899421; cv=none; b=TA+yC3qYu7LyW9IwbgsZzvRDbLBMNhmkmgkFStxoqUHeK/0pSa7RtCdG5+f0+dsaFfAQZ/fET6ogjlqrVCTzBHIsKvEWUipNpCCyPxT0EDayb01dKqUPD5nQrs3AEfiq5FTxjZAtyOVyF3wwXPKM0edUlb153v2cjQe1YafzUNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724899421; c=relaxed/simple;
	bh=DWm23k7XBAocyEKPJBk5LMKw2oNzaDSPu+zw8dkUTMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fZJp/osUtGNek+qs1OHkAjml5xJXGtqRNHoI0SUnwmIrBTdI+A7rnURZlvx+RkSdBZXAw9Be/56Kc06xbPyqfe0HOF7yrR+bwnY6cMSP/8sGFx/4cagCJ3gcUhRg+e3kDxFwYejqTdDNnz5EXj8EJsuHYTwmVM0bOrrrBhJtMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvQV4dXc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvQV4dXc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7cd9d408040so104405a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 28 Aug 2024 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724899420; x=1725504220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWm23k7XBAocyEKPJBk5LMKw2oNzaDSPu+zw8dkUTMs=;
        b=BvQV4dXcWidFKMyiXeVH6mjGjfj4KJrN+KROy0Yw0/g3KKK9l1qfGqrqcDi1grhUZJ
         S7Q8HrNUr55KwtSreTgx2q8+fvUyen+3Kh9ujuYz+3Yj5NteNLhsdmJgAl4I4zlf5xb4
         Gyr4fujqhHLdfl8kHeICy6LeNUiNofRufgKSHvOH7PDEnmAJLP9/ay1l2cyb2IPubkbU
         sIq7TcszP24ybRBBWIDpJCQWn/AHw5lyYTgCAf6Q9J/7j5akaDGkNK8ZrbePl96cC74Q
         yv41/4teKZQZbmIemd6m1Q8Jx/BsPSY8qC7ISgVLAedp5spPJZ+tTeytG4Uz+yzMiZ00
         Chgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724899420; x=1725504220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWm23k7XBAocyEKPJBk5LMKw2oNzaDSPu+zw8dkUTMs=;
        b=j5ox7x29fDqbMDdUgH9gEsPhU9DeH2A2igbmdmrdgW0ZV0q40YhcmX4qjxoWCgXh4T
         WZyrrhxdYh8QmvyWYVPHj6Q+hLQhO0pk8OGEQUhXqmlWeyAsnWgud1ZpUJ5d1wFsFEQ5
         Ti7avFGGO3pRR8/o1CxdgzmOxvjfRhDEUnF7wqVb0O2vysj8JBwgtq6ZjTJj2W9rtHJE
         ZJcxN9/mUl2SnQy6NklDl/DHcVEBeVGQzls0+UF6C2h77fbzINRajUqGaxSkxlFk8am8
         ACNEkwSmF0+hkv7utsld3v6jTPzh6Hgx6n8d/QhKshRWrPAzodVdz+E3fvD9uP1anAdF
         IM/w==
X-Forwarded-Encrypted: i=1; AJvYcCV46cf72InskBPxjyqYGzR2hJC5AOytb8eJd9My0Jg+tOsrSLZts1PM5T09yRraJMChc4oMO8AZXJUVvnXtzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR48aLJyOdzg5cQXCw57/qBkxhFiBWrQo1e55L9GtnIKXxpGhD
	q0yJQFx/uyBRFqAC27gPyVo9EKJ6947YvnQ5t1EotYcxKw1FwKXf
X-Google-Smtp-Source: AGHT+IECoXm3gqLjLYM4LRBq2yRXXo2UtFlBsGnwvFn4jMttDZcxuzLwqnJ6oPxbCVmdwKqBvZUSaw==
X-Received: by 2002:a17:90a:ba81:b0:2cd:40ef:4764 with SMTP id 98e67ed59e1d1-2d8561a13cbmr1294000a91.17.1724899419642;
        Wed, 28 Aug 2024 19:43:39 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b141fc9sm201283a91.30.2024.08.28.19.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 19:43:39 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Ping: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Date: Thu, 29 Aug 2024 10:43:28 +0800
Message-Id: <20240829024328.4163470-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240813081446.2711296-1-niuxuewei.nxw@antgroup.com>
References: <20240813081446.2711296-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping this. PTAL, thanks!

Regards
Xuewei Niu

