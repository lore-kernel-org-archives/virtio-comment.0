Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F5236F98
	for <virtio-comment@lists.linux.dev>; Wed, 11 Dec 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733911516; cv=none; b=oAdiAMMNaGLYzMXarTHZMlgwDCSoT52Mwb15Cmhd96tVuMXRItuRFOsa7CVvcc9fqF1Pmz101ElI5cfihkyzn9EUtShKK1tQVme3nShnaxIfOWmE/xG2ijL5UiYZUr5hUOOHdNkpXg8Cq3j1uZBEyHE5XqCvlpplkBLR64DeVAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733911516; c=relaxed/simple;
	bh=HR93NZmtoy0BnjMfjbAAHAX/z3AwjH4uznSrR/JfSsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DMb7KwmndyNia6h3z15st/Z/q0bw2FDuWbKRDgjCqzHXISqXsjux243OOgxqe0BOZwoG5ZJmTZDVZqXmKui6R9LR7yyTOaQuFdF37AzDgl/WQQsZI+SZ8xfrO4FFxn6jiSH0R0/sPZiUeNHqHvPByWoPEpdESPSQaee1K0ozX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tLJai-0002sL-MU; Wed, 11 Dec 2024 11:05:12 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/2] virtio-net: add support for receive timestamps
Date: Wed, 11 Dec 2024 11:05:02 +0100
Message-Id: <20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM5jWWcC/x3NywqDMBBG4VeRWXfAJJZeXqW4EB3tvzAJkyEI4
 rs3dPltzjmpiEIKvbuTVCoKUmxwt47m7xQ3YSzN5Hs/OO8cV8cDW8qYuUINiaMY68GGXYpNe0b
 cOITnvQ+PNSzyotbKKiuO/+czXtcPlpL5t3cAAAA=
X-Change-ID: 20241211-v1-4-topic-virtio-net-rx-timestamping-3385037f3de9
To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

This series adds support for having RX timestamps in the virtio-net
header. Make this a configurable option in the spec to not unnecessarily
increase the header size.

To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: kernel@pengutronix.de

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Steffen Trumtrar (2):
      virtio-net: Fix receive buffer size typo
      virtio-net: support receive ptp timestamps

 device-types/net/description.tex | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)
---
base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
change-id: 20241211-v1-4-topic-virtio-net-rx-timestamping-3385037f3de9

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

