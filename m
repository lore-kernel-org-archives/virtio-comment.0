Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D216D4E8
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186913; cv=none; b=dLkJN868Hhzc9psBeTqZQ4N7cH+fQD9U5nrYq/glEAo5doeo26jLnelqrIr6PqNfTxnjPgpx4G3BypW5yy5Z8kIGhlDFTn7F+ltGtaOY8F/S2e9W5lU+W1bHR9778IIdzVhbblAwr2YDbeI6FNZvrqM5SiO54UM5kRxJcwdHYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186913; c=relaxed/simple;
	bh=AQ+IRGZpSPqn5DUX/qV6U+p5a3UgoCKe29Su91cLNdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFXIlW+smmzuSl/tVp703l8rH832D0uewEMnFO4R5zi9O2/Sz5iHKRXuD7imDYq2SAVdSEBMGwr85aY8yuroxk09YwY7UC8/iNsld9hDOdurS56ppiYqdXE5vNknBSZF68Q+0sjioLqUBjbM/Kr/H2J68qfIS1dTmwUfeT9NPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlEeGSAn; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlEeGSAn"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-705959a2dfbso614902b3a.1
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718186911; x=1718791711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7FDKTvuCmRzl4O86z1mlk2RLiuwYwNq/cKK+20d+os=;
        b=QlEeGSAnvaFGU9j7rSJ5vPQXfriX7mqjfOnBCX+cv/xBukxtbSmuYhU/k475YfwOfI
         iIyJISV+EPr7cnN/dV29I70EloBp6XgbGV07wWmzQ9mhEC7jEkfv9VKYU47y2PLVPBYD
         avkDCywcdLs6gMm2lqFOwieJmZUlojKtj2dKV51y91nujbLs2AlI66USjP5ExQWsXsEF
         +C+FCd/tzXp2VSuSMqMsuzdOc7l4luhW4SDubu3xZ5XBpr4nqYYbJIWCkSDJgRv2sI/q
         uxZosy/0xFktwLFoXzw7QBlouohntA15SZwFGcyhe5WZim2Bv2Z3Vh4SQUfEINgdL8ma
         kK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186911; x=1718791711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7FDKTvuCmRzl4O86z1mlk2RLiuwYwNq/cKK+20d+os=;
        b=iJ0cKRbnP4HuUC/PcW/C9uGIYeVNX6AWe+IGMu2yuRSx7CV0eTlIsVEbmpf1UrutLW
         TW8Qs10/6OK5N8i4+qlrKKjjPHdXhD0bU9ADZOckNZRKcLtRsnvsUeKveszGDY2SEgY+
         kuJvNII7HyMJYFOrkvxJfCHJBCDSK/PzUvtY+pBndD8y7AF7pWeLhUKI2d5kkGUpLxwo
         H0uGNDCM6u0XmpkXlZy11Y8vmi7KftuFV6uVRy2Qbc3t4EOg/xpdciCaUX3dpDSsCYGJ
         pXMCb8/ODagxVxQcou84HZUlNtB57yQRfufxqZY3Es6OU1ygB3krQkWHitrBTt+32gKc
         /r9w==
X-Gm-Message-State: AOJu0Yz2Ozyb+w3WiRCmLaY7LDLvtgga2YICOZHixu88ZyXqhZsqzG/M
	i7ZqMf3QUv8D9LJ4MklAsVJhffBd/pEkfB844TDkTa8yCHC9T2kNCLtF2rzoymKt7g==
X-Google-Smtp-Source: AGHT+IHiyI7yuyuEFWRdi2o4CQ8jWKtbTdhICG+Y/T6I5cDEx3uJHooF3BIZqMi0oKRASIz2e3KnHw==
X-Received: by 2002:a05:6a20:9695:b0:1b4:4ed4:91e9 with SMTP id adf61e73a8af0-1b86bc48586mr6143269637.3.1718186910974;
        Wed, 12 Jun 2024 03:08:30 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6f9af7662d7sm1195932a12.9.2024.06.12.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:08:30 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH v2 1/2] virtio-vsock: Introduce "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
Date: Wed, 12 Jun 2024 18:07:43 +0800
Message-Id: <20240612100744.2443429-2-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612100744.2443429-1-niuxuewei.nxw@antgroup.com>
References: <20240612100744.2443429-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "VIRTIO_VSOCK_F_MULTI_DEVICES" feature represents that driver allows
multiple devices.

v1 -> v2:
- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES".
- Remove description from the relationship clarification (Stefano).

Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
---
 device-types/vsock/description.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
index 7d91d15..7e310f7 100644
--- a/device-types/vsock/description.tex
+++ b/device-types/vsock/description.tex
@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
+\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple devices.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
-- 
2.34.1

