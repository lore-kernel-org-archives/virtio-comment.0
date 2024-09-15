Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98C22315
	for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726387003; cv=none; b=OOXSbLSZZzGsqA/LtEDmt/5LTy13LXVxQ6TAP6ygbXQ20V3P2qboV/hjz6OkWg96pI9WiaoshU3LK5si0fCiS0VxQAkgZa73O0uf/iz/WIsp+wlD3Sf1M6gjCRBrFNiXLUwAqQcnj8emKBuapSQjYgIPEGUF5PNX4s6QQMuUvSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726387003; c=relaxed/simple;
	bh=VkYiLjg6yMSzI6bfL40IGQbW8+VndWTdbTbQFtOQAw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ceCjPkzn7Qfh6wvVNGjXZXVB6AT6LF1NAqQP2OMRlqeKY5+Yp/zhn2D6wBJEWjlRKp0B1jUxNwueYEn7OSAFqTRxem3+CvWQao6GJ56cjVkB7MbZTdrL42sS2n0fUy7Jq/1a5YLKOcsw1hCtZp00Ern7kE7BuxE3pxBAwtHWwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNM/xodF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNM/xodF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c4146c7b28so4369670a12.2
        for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726386999; x=1726991799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCZsMFi4BqyhSwrmtB4e31qKXmEO+YdNJDiKDL56eD4=;
        b=WNM/xodFo/j15kPb0JBtXh4t18vAsCHWrwT3BSlUH4tAwE8PJtelH+p9rLcPnMNAk2
         kY4kquUVr7HEFxCfRlCFh5jMyXJQyPpN11nH8uAtrw3PpUTITd8wip4FY7uVIed9lSiB
         CFmnle24q595AD/0gCeD+FxSVIhEAhvDiGbkcF4/iP28eLCivoUTAYciancUJ4nopKGq
         yFdbspMNg2dUMWlLdNXv54awjPL95Y8+K3FZd075Y7OKX/TjEMZu9rpwL4TBukWvrgDb
         C0p6yuOPyPgPBycpiMk3DJVRoXHA1tKiMrkZDxGHmVu4zucCkr/KEytWvDAmYRMqI8dV
         OV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726386999; x=1726991799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCZsMFi4BqyhSwrmtB4e31qKXmEO+YdNJDiKDL56eD4=;
        b=q8oT4BtvGBmggQUDdSnsPfBJFmyJvmaEJiOg6254stnIP+q+8jliMFQCGEPmHoIBad
         cPl4Y5yOezJhIX59Lc5BEf8ZvCb8f8ts3+Im1y6gaZGFJviELI+5/w5fRCvNNdN5TNaj
         gFwBV7vTMx/K3yHBbXSq3mvuG5OTdgLw8liXLqTgF7m899oGQq2z1fIDQE23zUmMbj2f
         Mk/sLnR5OwqRfpoLtXIfq957wx66N0i3Np/3+3Lzx3mljqHowWUDCIGypAhIK+b9tPBZ
         UCuqJDu8cASxXy3hRc9J1kKGTJOdHzfmI4TipQ+mpSXjkNkWGkVz9vzX6XjkagWGMN1F
         RYZA==
X-Gm-Message-State: AOJu0YyQ3NcZvcd1AsBTUakC4j3Wg0YYkwiY2XT+OaSwDdlHSXZNmZOE
	lYt1n9jm2mBKV5q/oqrULutmJkOsFtwWR/cJVsw7xqQOL4oPOcHy/hX6kOYMvBoIyx24lwGwadY
	Yjyw=
X-Google-Smtp-Source: AGHT+IEiWkSv4NBZk7Eealz59N8PYGOhpDBOXH5qJ9DCrJRzyxZ0Q9l37RaHxqaCJO6Wfca2VZoz9g==
X-Received: by 2002:a50:c90d:0:b0:5c4:a0d:78df with SMTP id 4fb4d7f45d1cf-5c413e6093emr7552167a12.35.1726386999256;
        Sun, 15 Sep 2024 00:56:39 -0700 (PDT)
Received: from localhost.localdomain (adsl-13.37.6.161.tellas.gr. [37.6.161.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bc88d82sm1410309a12.81.2024.09.15.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 00:56:39 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v1 2/2] Embed virtio-queue.h as PDF attachment
Date: Sun, 15 Sep 2024 10:56:31 +0300
Message-ID: <v1-proposal-attachfiles-2.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
References: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Using the TeX package `attachfile2` we're able to attach the C header
file as a PDF standards-compliant attachment in the PDF document,
allowing it to be a single source of truth for related files.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 commands-html.tex |  7 +++++++
 commands-pdf.tex  | 10 ++++++++++
 headerfile.tex    |  2 ++
 virtio.tex        |  1 +
 4 files changed, 20 insertions(+)

diff --git a/commands-html.tex b/commands-html.tex
index 488eacb..144bbb2 100644
--- a/commands-html.tex
+++ b/commands-html.tex
@@ -180,3 +180,10 @@
 \vspace{0.2in}
 }
 
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%%% VIRTIO C header file (.h) PDF attachments - expand to nothing
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+\newcommand{\attachsource}[1]{%
+}%
diff --git a/commands-pdf.tex b/commands-pdf.tex
index 23289d8..62d4169 100644
--- a/commands-pdf.tex
+++ b/commands-pdf.tex
@@ -196,3 +196,13 @@
 \vspace{0.2in}
 }
 
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%%% VIRTIO C header file (.h) PDF attachments
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+\newcommand{\attachsource}[1]{%
+{%
+This file is available as a PDF attachment %
+\attachfile[icon=Paperclip,mimetype=text/x-c,author=\virtioauthor{}]{#1}%
+}%
+}%
diff --git a/headerfile.tex b/headerfile.tex
index 767005c..d194031 100644
--- a/headerfile.tex
+++ b/headerfile.tex
@@ -1,5 +1,7 @@
 \chapter[virtio_queue.h]{virtio_queue.h}\label{sec:virtio-queue.h}
 \label{sec:virtio-ring.h}
+\attachsource{virtio-queue.h}
+
 This file is also available at the link
 \virtiourlh.
 All definitions in this section are for non-normative reference
diff --git a/virtio.tex b/virtio.tex
index 37e49b1..94f508f 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -38,6 +38,7 @@
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
+\usepackage{attachfile2}
 \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
 \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
 \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
-- 
γαῖα πυρί μιχθήτω

