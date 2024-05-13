Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5793D966
	for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715760104; cv=pass; b=M9pqcZvCRGNsHUsilQGi7P+ssgI0GTmmfxDQeWyen93wvViMmyo5xWxj+dSgpoHWjOnogh98SfpVzmemDxPgLNfv0sAzAjgI5c8C2jqQVzMz0R/FQ+PtU0wEJTA9YnA5UZ1BcWi7VzuUaohvQyIkiyZsJYiIi9hEIiRyajiyrGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715760104; c=relaxed/simple;
	bh=xqmbX89SRuErTKhPYfhpFz1AJO51JnT+CoBmIAWObew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jD5IorDnK0ppcnTG0M8z9rwdbvpzPgbdsLKa/yxV4M7qpDiKTDAwYkxitUuUsdve+QS7o1DRjWUnp3dJ85IobKQg/dMistfmMmDNvk8i/dBs/ORtdNMbbKEnGL6b08RI2sbImuwjSBzlD9/m2Ox3JlFN8XDx/69ENQMHUx9hC0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=redhat.com; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41fd5dc0508so43915165e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 15 May 2024 01:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715760101; x=1716364901;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:delivered-to:delivered-to:resent-to:resent-message-id
         :resent-date:resent-from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJcUymhwLGM+HMzb3cOxyjhy909neMJQymeFliarDa0=;
        b=Ckpa14wqN8F3kr1Nk+l1oOl5P9k5kvts7yVHM4GUlnPCKEuMc9+VByWRka9XiEx1cG
         YAKefvdTEIq5N4+8yuxk25aaNyKZhb+zLW4RsEDElk6bd1R57ipTctg9T7dw/uQOKeNN
         7xN7wAfWPFOuFZ7RzBUW/dtucl0W42XHg6mT6YXhVg/8NZ512llJnniCyB0BykPSw/pt
         UxMgGncRqE2vYLV/8SeLsu1IAzf8scrCYrl3JNY9VbmEtsouwoPOXKZI24yo0CUX02PX
         RbpAe6zF07ZxPsZM0TVZ9QEaJTbJpEMkKdqPVTXPrjJEAgPSeYf/hVlMszA2Ud0oB+vk
         ht4w==
X-Gm-Message-State: AOJu0YzKUXiYXHLjn/saWd/3nYBnyb8fGIRWxo8VDAxIjFBi0a+HDquQ
	XD1jQvFsoy1t5GiiQefYPFcciUEfIuZ7He1Pi7GlXkkmLli6MlzHOD5Z66pfAblrqcSeE5o1iUF
	bN0b8vjz5PxeYtCQULhfdOoqP8DGETDu5MthrVvk0h44f8dTcnQ33yAX3V6JKcKWlg2hKu6l3z9
	8Ns55nZ07ZYwtq14Qp9OLI54uOl1IRogcG62PIU51z
X-Google-Smtp-Source: AGHT+IEV6HCvWsp5CTDQo8vHmR1g1vtOqGotahtRzrvcfO+uUiK/MTd0GSrh838mQb/8Xk5hevQ6BA==
X-Received: by 2002:a05:600c:3c85:b0:41a:1b3f:b465 with SMTP id 5b1f17b1804b1-41feac55fb9mr114497465e9.26.1715760101216;
        Wed, 15 May 2024 01:01:41 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42009eda143sm160774575e9.14.2024.05.15.01.01.39
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 01:01:40 -0700 (PDT)
Resent-From: "Michael S. Tsirkin" <mst@redhat.com>
Resent-Date: Wed, 15 May 2024 04:01:37 -0400
Resent-Message-ID: <ZkRr4SESznATgjo3@redhat.com>
Resent-To: virtio-comment@lists.linux.dev
Received: from imap.gmail.com [74.125.133.109]
	by tuck.redhat.com with IMAP (fetchmail-6.4.38 polling redhat account mtsirkin@redhat.com folder INBOX)
	for <mst@localhost> (single-drop); Mon, 13 May 2024 09:33:34 -0400 (EDT)
Received: by 2002:a05:7022:c8d:b0:7a:7b9f:ea34 with SMTP id ek13csp2069923dlb;
 Mon, 13 May 2024 05:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2;
 AJvYcCX1l3gmhAzNizlWfLmzrkcy8/QRZEbKMoF9u1PfLvQUMkLWuClkob0lWqibhZKkzjQ1JfTeuAi6Wgox73t3vrPyMC+xOulMZ583
X-Received: by 2002:a0c:c68f:0:b0:699:49d9:140f with SMTP id
 6a1803df08f44-6a16827c71amr80306696d6.64.1715602793210; Mon, 13 May 2024
 05:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715602793; cv=none; d=google.com;
 s=arc-20160816;
 b=eZt9N7jyNhpnhcaX5QQgA2ggsYTbdPndg8fOBfDTqYLFld4Dgmx5BdgjCf+UgGepMS
 JBqblR9OFfZitknS2MNYkwHsIZYOvUP3JQD99Kfl3rriflPPoPsF3IvMoODK0OQK8rX4
 zchcAWlGOyFTyEjbCp3yG4QCtCGuqENrc7pXu4iMGRq390TiJtdE0S25o1l3AxzwJ3CR
 EpTZa4MTy0ioVpC5MPmGkJgR7IKd75mxiU21mAREkUnHjZ3u2LNK9d03esRNm5646/YL
 Gz/YYuH3BPkFgLapEXFUR1KppqvEREbWP2FArNq5KuwxYh6HByl+laoBvb9/UHyAN+rw TMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; h=content-transfer-encoding:mime-version:list-unsubscribe
 :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
 :from:delivered-to; bh=JJcUymhwLGM+HMzb3cOxyjhy909neMJQymeFliarDa0=;
 fh=STZg35O+iBQ3gLGwSi9s8w9/63gdxlhGzXEPG1ZCpKU=;
 b=I6wsupNdeDhTBKE7Ir8639EjGzJoEHDBAwUgGe9Wk7pi7pxkGoAP3IStxRPySqgXtH
 FRo7A6b73/MPRprthuZf4RUBfBZIHl3CiI7m9oQr1fSIPmc1ajpkJUx+SR7+bpZFGedL
 iroWX04ClwbqJPnf7Eit1aFcKMq91df6PxjWzdoyglukArOJniYSirWDPgvvipDHm6tv
 nZU5YJxWH+8wov13NgfoQzwOdSdueC4EEkKp/REBbfASYpQpTFL0QvIIr4mMIfwN1mBe
 uKBfJ94C/An+CJf8NQhyo4DKnqE4qVam0cV+AZPFtvz3TboG9VR83XmsikgoLQ9UUkz+ totg==;
 dara=google.com
ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com: domain
 of virtio-dev+bounces-3-mst=redhat.com@lists.linux.dev designates
 139.178.88.99 as permitted sender)
 smtp.mailfrom="virtio-dev+bounces-3-mst=redhat.com@lists.linux.dev"
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com. [170.10.128.131]) by mx.google.com with
 ESMTPS id 6a1803df08f44-6a15f2b5f07si73333976d6.381.2024.05.13.05.19.53 for
 <mtsirkin@gapps.redhat.com> (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384
 bits=256/256); Mon, 13 May 2024 05:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 virtio-dev+bounces-3-mst=redhat.com@lists.linux.dev designates 139.178.88.99
 as permitted sender) client-ip=139.178.88.99;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-2EZoS5RTMv6dIyAyOmYd1A-1; Mon, 13 May 2024 08:19:51 -0400
X-MC-Unique: 2EZoS5RTMv6dIyAyOmYd1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256
 bits) key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested) by mimecast-mx02.redhat.com
 (Postfix) with ESMTPS id 691188001F7 for <mtsirkin@gapps.redhat.com>; Mon, 13
 May 2024 12:19:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix) id 658692026D68; Mon, 13 May 2024
 12:19:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23]) by
 smtp.corp.redhat.com (Postfix) with ESMTPS id 2D7762026D37 for
 <mtsirkin@redhat.com>; Mon, 13 May 2024 12:19:51 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120]) (using TLSv1.3 with
 cipher TLS_AES_256_GCM_SHA384 (256/256 bits) key-exchange X25519
 server-signature RSA-PSS (2048 bits) server-digest SHA256) (No client
 certificate requested) by mimecast-mx02.redhat.com (Postfix) with ESMTPS id
 131DF3C0DF66 for <mtsirkin@redhat.com>; Mon, 13 May 2024 12:19:51 +0000 (UTC)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-znrp_bzyM1iu80XywTfsng-1; Mon,
 13 May 2024 08:19:49 -0400
X-MC-Unique: znrp_bzyM1iu80XywTfsng-1
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org
 [52.25.139.140]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384
 (256/256 bits)) (No client certificate requested) by sv.mirrors.kernel.org
 (Postfix) with ESMTPS id 2CD72284418 for <mst@redhat.com>; Mon, 13 May 2024
 12:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 smtp.subspace.kernel.org (Postfix) with ESMTP id A3B8C14D293; Mon, 13 May
 2024 12:10:15 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53]) (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256
 (128/128 bits)) (No client certificate requested) by smtp.subspace.kernel.org
 (Postfix) with ESMTPS id EB54F149DEE for <virtio-dev@lists.linux.dev>; Mon,
 13 May 2024 12:10:12 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5b27e8ad4b6so1953705eaf.0 for <virtio-dev@lists.linux.dev>;
 Mon, 13 May 2024 05:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAtnNqSqVGHHrEYWKsl2MS/nocYO07xZcE3BPbgFULNs7pxe8aEIqJOzfiyaNqVNKY3YZt9zMeL3xQXCjGc1jgAHm3GBeBWQ9Y6w==
X-Received: by 2002:a05:6358:8093:b0:18d:787a:4155 with SMTP id
 e5c5f4694b2df-193bb400f5dmr1111548455d.1.1715602211795; Mon, 13 May 2024
 05:10:11 -0700 (PDT)
Received: from always-x1.bytedance.net ([61.213.176.10]) by smtp.gmail.com
 with ESMTPSA id 41be03b00d2f7-63411346d46sm6578498a12.79.2024.05.13.05.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Mon, 13 May 2024
 05:10:11 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: virtio-comment@lists.linux.dev, virtio-dev@lists.linux.dev
Cc: david@redhat.com, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 0/1] balloon: introduce 6 memory statistics
Date: Mon, 13 May 2024 20:10:04 +0800
Message-Id: <20240513121005.459013-1-pizhenwei@bytedance.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition;Similar Internal Domain=false;Similar Monitored External
 Domain=false;Custom External Domain=false;Mimecast External
 Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom
 Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat
 Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat
 Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

There is a previous discussion about the new memory statistics:
https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@byt=
edance.com/T/

This may be helpful to describe the usage of these counters.

zhenwei pi (1):
  balloon: introduce 6 memory statistics

 device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

--=20
2.34.1

