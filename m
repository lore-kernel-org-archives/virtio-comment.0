Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F9136663
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227350; cv=none; b=q0gQrvxs5qcI8fb0EGEvjvGQqxLJD8R964ZAefrEaKbwNOgaQqsAKahgjGjha6/xefIpzc88gjrddM3jgn77RNZGiMy/P+vqA76jHvKxBjDAOILVDh1aMHIUWhypwjwEXvTGMOoCucW5xo94HiBk5OiTsa88kQoZ6S4yPcXAaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227350; c=relaxed/simple;
	bh=sFNbNdVSJy4l1bPMfxz5/o/wfB6iOYpD/Dlw58yTCAQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NcbGjeyza7fqZVsXO+SWbiBr1vzxW2Ns6o2lXK9mkDzSLe4LTYtBtIcLX9xN0TrYi+WUsz7yuCf+zHUfsAV3Lt4TQZEWFVEpCOOLHo5Y3MIFgbNcDGSN5gKLZYwNIchqJu72BrZom7d65eCSjWxFFh6G7rnd1HH+B1LQ6eW6oEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1sLhZL-0006Ss-8u; Mon, 24 Jun 2024 13:09:07 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH RESEND 0/4] virtio-net: add tx-hash, rx/tx-tstamp and
 tx-time
Date: Mon, 24 Jun 2024 13:09:03 +0200
Message-Id: <20240624-v1-4-topic-virtio-net-timestamping-v1-0-fa3c163e4aa9@pengutronix.de>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: virtio-comment@lists.linux.dev, kernel@pengutronix.de
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.13.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: virtio-comment@lists.linux.dev

The linux patch series [1] adds support for transmit hash reports and
receive and transmit timestamps.

This series describes the added flags and how the new features are
implemented.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

[1] https://lore.kernel.org/all/20231218-v6-7-topic-virtio-net-ptp-v1-0-cac92b2d8532@pengutronix.de/

---
Steffen Trumtrar (4):
      virtio-net: support transmit hash report
      virtio-net: support receive ptp timestamps
      virtio-net: support transmit ptp timestamps
      virtio-net: support future packet transmit time

 device-types/net/description.tex | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
---
base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
change-id: 20240618-v1-4-topic-virtio-net-timestamping-0ac98fc8bc42

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

