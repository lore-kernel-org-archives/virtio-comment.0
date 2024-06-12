Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77916D4E8
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186910; cv=none; b=sSPmNDwFh271Adq11AqNpMmEQPIDpOVGnxG8fUMhvWtPCXxWu0XoD8ECeuud3l4bBWvcoXVYwAd5Oj+TS51GYQnB2Fl5u6dV5FlHs/xaIO4Yxli5U7xcZusswwtZCiQ68qc9roiCxTIAj00T+FE/rf1w2WOVALSu+rTalGEpNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186910; c=relaxed/simple;
	bh=IuUJLdKZdZbeJDhY0dQZ0SrfRh0LIFLdj900BeeNydk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T2Z1HePbGaLeSq9LhCbpzQqcw4wmU1DMOt1Vo+soUncLBd2EL20t47BubY1SliPxct5lRvp2LpvnOl/JDzzoeXcr+60YyFOBs5QwtYPLOYl6YyedJ2Sb8rATqxq8k4kEmeBWUCQIjYEY96xxhVii5EiN+HNzRbNo6Itf2RzTRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbZvym+Y; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbZvym+Y"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-705959a2dfbso614882b3a.1
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718186909; x=1718791709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3f+byUPLAXal4wn5Hr3JJqUe2Da5b5/ql8PcOPa1xs=;
        b=ZbZvym+YlN/pLW8W2QpZwJcJOPW0difIW7EJj8Hi0RBW1tEJJajLTxk9g9OIGmXoHa
         jwtPrwNlEtC/yj+OipgAHPoLMoB2thfsEbZe/IQPmhCUhm51dRrJQeD40kqlmhEmc0sY
         IKRcFkjsBmDm5edjFWQEF6vU/LvwdFnzwg4C10ZtChtsZi6n27YxUHxWSFExeEMdHYit
         C8YMXkp62NHbPn+Jj3nDrnYJB1tbpbHuojWxKcW7kvVWEAermbloxnWl7ouFo/v0CLu8
         h6BosRD1DXrZ8XygSMM11F1V8Sg6+XzGRNLRh11UiDPAvTa9/Ho+KM6NxtHpSe8u0eHe
         1rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186909; x=1718791709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3f+byUPLAXal4wn5Hr3JJqUe2Da5b5/ql8PcOPa1xs=;
        b=dUBQpVoTdwxdE707Wgpd8UYIXMR3r6LkoQC2PYBFySwrLkOrTvNw6ekfhpH/wLCpzs
         tSctwa0nxl+ntXhRadwYeBdkHbqa6/DAYB19ndR2Qc6DTnDzx+6F8sGuao4QOMSLXVU4
         qdok/Wbn1QbHX6M3pHHYpAYaQ6T6cqwWpKFKaR+nB4Ih/VxyZIcSPBSJMcSI52oQo5tP
         O9PolNHiCzE9OypYJqR4fSPBJZDpxT1bxtGg9K5LUKNjJrlsYxFYVXZwOnUX4bir9gmP
         yEi6J7aNisQT48ERLfUP4j+9R72TWAcZBRpkGG4k34wXPoeK+qWhNe9EQ0k0OGVBiLDr
         7GJA==
X-Gm-Message-State: AOJu0YyxD1NkuGwjQsdFmDJRbK47/a1F8kxZ30DxvB6nBZrMB+gjVEfZ
	emZcvHuNCeGRfIQAHqXVvjAIsR/rVgHVXt2uZgOseqXFrqG/G6pF
X-Google-Smtp-Source: AGHT+IF224Ihfjv5yCMTPQW21BpMrdwHrGEg5aH1pUoBof3e6Qg+E6UOyUytiIaqymixmoaUrQQOMg==
X-Received: by 2002:a05:6a20:96cf:b0:1b5:88f5:5823 with SMTP id adf61e73a8af0-1b86d376213mr6017706637.27.1718186908630;
        Wed, 12 Jun 2024 03:08:28 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6f9af7662d7sm1195932a12.9.2024.06.12.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:08:28 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com,
	mst@redhat.com,
	fupan.lfp@antgroup.com
Cc: virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: [RFC PATCH v2 0/2] virtio-vsock: Add support for multi devices feature
Date: Wed, 12 Jun 2024 18:07:42 +0800
Message-Id: <20240612100744.2443429-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I am writing this email to request adding a new field for virtio-vsock spec
for supporting multi devices feature.

The multi devices feature allows the guest to have multiple vsock devices. I've pushed
the first version of the patches to the lkml[1].

v1 -> v2:
- Remove implementation details from the document.
- Rename the feature to "VIRTIO_VSOCK_F_MULTI_DEVICES" from "VIRTIO_VSOCK_F_MULTI_DEVICE".
- Rename the field to "index" from "order".

Thanks,
Xuewei

[1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com

Xuewei Niu (2):
  virtio-vsock: Introduce "VIRTIO_VSOCK_F_MULTI_DEVICES" feature
  virtio-vsock: Add an "index" field to the config

 device-types/vsock/description.tex | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

-- 
2.34.1
