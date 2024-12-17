Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6EE1DFE0C
	for <virtio-comment@lists.linux.dev>; Tue, 17 Dec 2024 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433697; cv=none; b=MaW0ybXRM9dBdEBouBqMty94gaOw4prISsp6X3z1BSwPxQIxzM5jgXGQ92cNLg8ykF3G8HjXD8fqILhZYwqjaQKnY7E3eEeS1i1ZfircUMFuVR5sigknIYj5CX0KG0edwpP08+5qoEqpQl7tlMSdRob3Hui2X9KCGf5TrlrMf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433697; c=relaxed/simple;
	bh=CY75e1IQFvPPQ00idZOpFdG7u92iw566nZiRa5RxWqg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lR923+dlPsPVQxeI8pHtRV38NI84W23eum9OC4DiIGWAhedUsjCV3JG8a+Yw6QQqM9F/N+X4MfTkNzxDr6fUhjZOljv6c5DaphoMeYhQP0uWVhC/qfYnfHtxNcDP0n97kOCZO4xR64mF0Uk25bi3PwiTFnZXDiRMZR567IKgxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tNVQy-0000KN-35; Tue, 17 Dec 2024 12:08:12 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/2] virtio-net: add support for receive timestamps
Date: Tue, 17 Dec 2024 12:07:54 +0100
Message-Id: <20241217-v1-4-topic-virtio-net-rx-timestamping-v2-0-4d9935910280@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIpbYWcC/5WNQQ6DIBBFr2JYdxoBjbYr79G4UBl1FgKBKbEx3
 r3UG3T5fn7eO0TEQBjFszhEwESRnM2gboWY1sEuCGQyC1WqSiopIUmogJ2nCRIFJgcWGcIOTBt
 GHjZPdgGt27rUzawNPkR2+YAz7Vfn1WdeKbILnyub5G/9t5BfJYzGtK3CZqz13Hm0y5uDs7TfD
 Yr+PM8vGypCzN8AAAA=
X-Change-ID: 20241211-v1-4-topic-virtio-net-rx-timestamping-3385037f3de9
To: virtio-comment@lists.linux.dev
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Parav Pandit <parav@nvidia.com>
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
Changes in v2:
- Add "Fixes:" and "Reviewed-by" tags
- Link to v1: https://lore.kernel.org/r/20241211-v1-4-topic-virtio-net-rx-timestamping-v1-0-bdd882e7b53f@pengutronix.de

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

