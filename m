Return-Path: <virtio-comment-return-8332-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E65C4332F
	for <virtio-comment@archiver.kernel.org>; Sun, 12 Nov 2023 14:06:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9381D2AEF1
	for <virtio-comment@archiver.kernel.org>; Sun, 12 Nov 2023 14:06:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 75CD398655C
	for <virtio-comment@archiver.kernel.org>; Sun, 12 Nov 2023 14:06:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B677986524; Sun, 12 Nov 2023 14:06:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46DE7986529
	for <virtio-comment@lists.oasis-open.org>; Sun, 12 Nov 2023 14:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699798008; x=1700402808;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tzDLFp2giv28cIrekIDuWtCWkTUOebRLVFsBzzcXYM=;
        b=qOTxfYcR8dZyS0LLc3pGKQVyAdpOkohBdH6kzEqKrmt3eFcTXGLNyeboKZrfLOJoec
         t2qwD+kbpTM2BszNE4rcozeS4z3hea+6RUb4qABesv7KDJx21KuG+FAZU41RuHchc9ME
         3soYbMsDWfY8IU4k6ZU5TSkx0IunIbJSnGhiZ4F/OkZmr1I8mPmS+Z0yQvAn8AnyFnuv
         Kuz+qoFZILQH1DvQB2ui6OpVdus5ODbPRX32BOJ7VWJlZkAjVtTwk4y+2VpPS9/gyOFH
         8SSCVWufz8MTmklBV6qEUesH2ZV5MM8emn9niYYIVgVDOi365ITn4uhiokf48UpnEisj
         ZDmg==
X-Gm-Message-State: AOJu0Ywil5Csayw4MVRuge/1kY1cnI+IvFeUSZIOwAF+MhkuNmfcMqqB
	T832WAAaFiCKaVFBiiqZPF8h66ZqM2PErMo22vtSTA==
X-Google-Smtp-Source: AGHT+IFswo+HLpU1b+o+CZLVMGoX/ZKbduSBxARDUWQOtHkVJCno3ZLLF9kEYyHIeBpHXkhFyghjGg==
X-Received: by 2002:ac2:4344:0:b0:4fb:9f93:365f with SMTP id o4-20020ac24344000000b004fb9f93365fmr2541219lfl.38.1699798008376;
        Sun, 12 Nov 2023 06:06:48 -0800 (PST)
Date: Sun, 12 Nov 2023 16:04:41 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: virtio-comment@lists.oasis-open.org, "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
Cc: 
User-Agent: meli 0.8.2
References: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
In-Reply-To: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
Message-ID: <40kj9.b1c40ocbzv0u@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Subject: Re: [virtio-comment] virtio sound: add missing definitions for 12 and 24kHz sampling rates

Hello Andreas,

The spec says it is purposely modeled to be compatible with the HDA 
spec. HDA is optimized for specific multiples or submultiples of 44.1 
kHz and 48 kHz. Specifically, look at "5.4 Handling Stream Independent 
Sample Rates" and "Table 56. Defined Sample Rates". My (unexperienced) 
understanding of the following statement is that using such rates with 
controller hardware that is made for HDA will result in timing issues:

> This implies that the controller and link must also provide for an 
> exact sample-rendering rate at the codec, in order to avoid any long 
> term drift between sample delivery and rendering and the subsequent 
> over(under)-run of codec buffers.

https://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/high-definition-audio-specification.pdf

If that is the case, I think the best approach would be to specify a 
non-HDA mode of operation to support more sound hardware. The most 
straight-forward solution though is for you to resample the audio before 
and after it goes through virtio-sound.


Regards,

-- Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

