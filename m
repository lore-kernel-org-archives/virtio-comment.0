Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DAE2FBE14
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113746; cv=none; b=VRqPFvJp2M66vRbDz93+d8GI7DzT3JEkcjG0oWgV3e+MIO4qARhvbNNUg2XlNpG5KMdQnIEFbxqIOvNPMObt8GOVFX5DOw4mfO69mkjY8WSqQcnRu4m1gTxM75fnJgib5DK+ZmXUkzhSI4WQ+lwDWsd/DX73giJu+LcSjMGn/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113746; c=relaxed/simple;
	bh=dg+F6eGmv2/xJgCdVZdB+Wnyr3tN05PfG+W2eSJsIow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKXa4tEqaUjZfqTfTj3OjPsOszS9QVA9fsN8oBWkccocCPvLMys25iuC+mEhKNBPgz1SXyQbe9npxsUOo24i/UzhNO87R53xVlBOCHSTigZWaWyAilsE2upGeTfJdKK2vwsI1yf//umr3iWQOioNbvYxo15o5WgmrOpG2UJkOzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdUkRzV8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdUkRzV8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so358034266b.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760113741; x=1760718541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVE8IOtVkKAYsK0IOYATKoS+TTBzNKPkyHhALqFS4Bg=;
        b=HdUkRzV8Cqab3r9ZVd1RTDnmqBlo+SB8MzqWX3yVFE+IhEGR3vnAJ9xIE7vwUkLVZB
         THFfoelEFwqNVH2O2t3cPz1qVir1PHgtM70saEpvIDu0wvghCGZbyj3uM9RoyPKGXBxn
         /m88/Nn9NotAnQbJx9SwekDOfHGxAEGN882H8VtvrqaBDgvbJ0A2hAhIsKGMMBO/pk8E
         FEtreZggNWBSq/Se2x326tJLVasU1uYtTbHbGEGA9XGFv621ccN7KPy7pUep5Q5nAx9o
         YtQpYeP2pJvLZj13v2+Z3y2rsg8Ktc40+4vLQ0NrR7gWoIdjnDsruWPy9NtscoZg/uhe
         Hbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113741; x=1760718541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVE8IOtVkKAYsK0IOYATKoS+TTBzNKPkyHhALqFS4Bg=;
        b=lOzgw5MMKigmEfQLjLhTdN3veKJkL5W1FntCm1a018PxC110cUINMr2VYv6e/JTHg0
         MgS2d2mP5sXcmTayeOxKql/PAyQnaLRGQ/ycRd/C/aYLE9kiiBohEpmUp/wb1EVedFFn
         fKHohttTkrfxuhT1tCpgKxbjhCvqqbK1L+km6ebjUz2pSvvX6CjTCarFTj7K4slLIBX8
         3CKF8x7mR6NtL8BQYzjk/iav7vBMuGAoeYVVfubik5IkMWF5HY9sSuU9wNST+hs7aigp
         EV8UgqEyghK4doimhluhZeU+6Gf4+phCuwN8kN0HTdnlqaTvilf8oOvsR2Otu7/kSvzs
         djXQ==
X-Gm-Message-State: AOJu0Yzu397V/p6E2PKD9HJCRE+1GO5sqksR1K9lve/u6GMHuUN4RMTG
	FgtreB68rB4YjIDFEFj1gIsIhymTmAuIYFYILWuij9azxYHiow012+4gDTlEqDL9tTBkCK4vT2y
	qP+LO
X-Gm-Gg: ASbGnct3kDlwhx5lNbhkN3RkSctQ9mutAwilQTTys6++NKVKlHzFSW3jIUrrJGD9ar5
	pgFmc6X75mDZqe4ml7vkzv/niJ7CE8OMqB1gi4jrK0K6P6Iu8XSq+VsB/Sjm3E0L3l2N+TDFGAS
	SYO+uWBL3boel3DUC8Yy3Ap2XjjWesRGmlvzIFssFJou8q7vXy2fcQyYzFqkczQ2nZayOmb67BU
	sQD3o5HEuaH41Kb17a3gyGfX8mIN0U/ACy7JybA95PHNhUErk+rGLa3+5ZkidgMzD98LC0VRlb9
	kpO32eXZyMxhtrZH9PmJo3N5VN3Ugcqu8Q3ZWj2QAArADMr2ajLFjjq7a5o/AroVdvqWlrsvmq7
	sgZcP6xt9O87/fk7t7dTneW8cxtD38fVLFdTCyQJXKod6sL5tKpMrzS6N
X-Google-Smtp-Source: AGHT+IGytlEpywdZqpUgNuvoclEz6eti4DZPqvBhAf1lZvhZKSjX90RC+j4XGWo6y9dzFUwAHPYVlg==
X-Received: by 2002:a17:907:7f8a:b0:b46:897b:d759 with SMTP id a640c23a62f3a-b50abaa3309mr1333968266b.40.1760113740899;
        Fri, 10 Oct 2025 09:29:00 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d5c2bsm270108466b.37.2025.10.10.09.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:28:59 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 81A075FA2E;
	Fri, 10 Oct 2025 17:28:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/11] README.md: convert embedded html to proper MarkDown
Date: Fri, 10 Oct 2025 17:28:49 +0100
Message-ID: <20251010162858.4107388-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010162858.4107388-1-alex.bennee@linaro.org>
References: <20251010162858.4107388-1-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no point embedding HTML inside the markdown document. It just
makes it messy to edit. The text is unchanged.

While I tried to exactly match the old layout I ended up making some
pragmatic fixes:

  - used # instead of ... in the code blocks
  - added missing - to "To do" sections
  - didn't attempt to block indent the lines notably "OSX users.." and
    the text under "Troubleshooting notes:"

The mailing list emails are also now properly linked for emphasis and
mailto: click-ability.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---

GenAI usage: this is a fiddly file to edit by hand even with the full
power of Emacs. However the prompt:

  please rewrite this in github markdown, using ## and ### for
  headings, droping the extraneous <div> and <p> blocks and using
  proper markdown links. Leave the words themselves unchanged.

worked though it like a champ. As the change is mechanical I don't
think there are any copyright concerns so I'm happy to put my s-o-b on
the patch. I'm declaring the usage here because how LLMs can be used
in Open Source project is a live topic of debate.

After the mechanical changes I eyeballed the README on github and
manually tweaked the formatting to match the original layout as
closely as possible.
---
 README.md | 387 +++++++++++++++++++++---------------------------------
 1 file changed, 152 insertions(+), 235 deletions(-)

diff --git a/README.md b/README.md
index 13ab05b..c81a1c1 100644
--- a/README.md
+++ b/README.md
@@ -1,252 +1,169 @@
-<div>
-<h2>README</h2>
+## README
 
-<p>Members of the <a href="https://www.oasis-open.org/committees/virtio/">OASIS Virtual I/O Device (VIRTIO) TC</a> create and manage technical content in this TC GitHub repository ( <a href="https://github.com/oasis-tcs/virtio-spec">https://github.com/oasis-tcs/virtio-spec</a> ) as part of the TC's chartered work (<i>i.e.</i>, the program of work and deliverables described in its <a href="https://www.oasis-open.org/committees/virtio/charter.php">charter</a>).</p>
+Members of the [OASIS Virtual I/O Device (VIRTIO) TC](https://www.oasis-open.org/committees/virtio/) create and manage technical content in this TC GitHub repository ( [https://github.com/oasis-tcs/virtio-spec](https://github.com/oasis-tcs/virtio-spec) ) as part of the TC's chartered work (*i.e.*, the program of work and deliverables described in its [charter](https://www.oasis-open.org/committees/virtio/charter.php)).
 
-<p>OASIS TC GitHub repositories, as described in <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">GitHub Repositories for OASIS TC Members' Chartered Work</a>, are governed by the OASIS <a href="https://www.oasis-open.org/policies-guidelines/tc-process">TC Process</a>, <a href="https://www.oasis-open.org/policies-guidelines/ipr">IPR Policy</a>, and other policies, similar to TC Wikis, TC JIRA issues tracking instances, TC SVN/Subversion repositories, etc.  While they make use of public GitHub repositories, these TC GitHub repositories are distinct from <a href="https://www.oasis-open.org/resources/open-repositories">OASIS Open Repositories</a>, which are used for development of open source <a href="https://www.oasis-open.org/resources/open-repositories/licenses">licensed</a> content.</p>
-</div>
+OASIS TC GitHub repositories, as described in [GitHub Repositories for OASIS TC Members' Chartered Work](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work), are governed by the OASIS [TC Process](https://www.oasis-open.org/policies-guidelines/tc-process), [IPR Policy](https://www.oasis-open.org/policies-guidelines/ipr), and other policies, similar to TC Wikis, TC JIRA issues tracking instances, TC SVN/Subversion repositories, etc. While they make use of public GitHub repositories, these TC GitHub repositories are distinct from [OASIS Open Repositories](https://www.oasis-open.org/resources/open-repositories), which are used for development of open source [licensed](https://www.oasis-open.org/resources/open-repositories/licenses) content.
 
-<div>
-<h3>Description</h3>
+### Description
 
-<p>This repository includes the <a href="https://github.com/oasis-tcs/virtio-spec/releases">authoritative source</a> of the VIRTIO (Virtual I/O) Specification document. VIRTIO document describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine &mdash; and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms. </p>
+This repository includes the [authoritative source](https://github.com/oasis-tcs/virtio-spec/releases) of the VIRTIO (Virtual I/O) Specification document. VIRTIO document describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine — and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms.
 
-<p>The purpose of virtio and this specification is that virtual environments and guests should have a straightforward, efficient, standard and extensible mechanism for virtual devices, rather than boutique per-environment or per-OS mechanisms.</p>
-</div>
+The purpose of virtio and this specification is that virtual environments and guests should have a straightforward, efficient, standard and extensible mechanism for virtual devices, rather than boutique per-environment or per-OS mechanisms.
 
-<div>
-<h3>Contributions</h3>
-<p>As stated in this repository's <a href="https://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md">CONTRIBUTING file</a>, contributors to this repository are expected to be Members of the OASIS virtio TC, for any substantive change requests.  Anyone wishing to contribute to this GitHub project and <a href="https://www.oasis-open.org/join/participation-instructions">participate</a> in the TC's technical activity is invited to join as an OASIS TC Member.  Public feedback is also accepted, subject to the terms of the <a href="https://www.oasis-open.org/policies-guidelines/ipr#appendixa">OASIS Feedback License</a>.</p>
-</div>
+### Contributions
 
+As stated in this repository's [CONTRIBUTING file](https://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md), contributors to this repository are expected to be Members of the OASIS virtio TC, for any substantive change requests. Anyone wishing to contribute to this GitHub project and [participate](https://www.oasis-open.org/join/participation-instructions) in the TC's technical activity is invited to join as an OASIS TC Member. Public feedback is also accepted, subject to the terms of the [OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa).
 
+### Licensing
 
-<div>
-<h3>Licensing</h3>
-<p>Please see the <a href="https://github.com/oasis-tcs/virtio-spec/blob/master/LICENSE.md">LICENSE</a> file for description of the license terms and OASIS policies applicable to the TC's work in this GitHub project. Content in this repository is intended to be part of the virtio TC's permanent record of activity, visible and freely available for all to use, subject to applicable OASIS policies, as presented in the repository <a href="https://github.com/oasis-tcs/virtio-spec/blob/master/LICENSE.md">LICENSE</a> file.</p>
-</div>
+Please see the [LICENSE](https://github.com/oasis-tcs/virtio-spec/blob/master/LICENSE.md) file for description of the license terms and OASIS policies applicable to the TC's work in this GitHub project. Content in this repository is intended to be part of the virtio TC's permanent record of activity, visible and freely available for all to use, subject to applicable OASIS policies, as presented in the repository [LICENSE](https://github.os-tcs/virtio-spec/blob/master/LICENSE.md) file.
 
-<div>
+### Further Description of this Repository
 
-<h3>Further Description of this Repository</h3>
-<h4>Building Instructions</h4>
-Authoritative version of the specification is maintained in the
-TeX document format. PDF and HTML versions are made available for
-ease of use and review.
-In order to build the HTML and PDF versions of the spec you will need the
-TeX document production system.
-The easiest way to get it up and running is probably by installing
-<a href="https://www.tug.org/texlive/">Tex-Live</a>.
+#### Building Instructions
 
-<dl>Installation cheat sheet:
-<dt>Fedora:</dt>
-<dd>
-<code>
+Authoritative version of the specification is maintained in the TeX document format. PDF and HTML versions are made available for ease of use and review. In order to build the HTML and PDF versions of the spec you will need the TeX document production system. The easiest way to get it up and running is probably by installing [Tex-Live](https://www.tug.org/texlive/).\
+Installation cheat sheet:
+
+***Fedora:***
+```bash
 sudo dnf install texlive-scheme-full
-</code></dd>
-<dt>
-Ubuntu and other Debian derivatives:
-</dt>
-<dd>
-<code>
+```
+***Ubuntu and other Debian derivatives:***
+```bash
 sudo apt-get install texlive-full
-</code></dd>
-<dt>OSX:<dt>
-<dd>OSX users don't need to install Tex-Live because they already have
-<a href="http://www.tug.org/mactex/">MacTeX</a> installed.
-</dd>
-</dl>
-<dl>The build process generates a ZIP package file including the
-original TeX sources, as well as HTML and PDF formatted
-versions of the specification.
-<dt>To generate the ZIP package, run:<dt>
-<dd>
-<code>
+```
+***OSX:***
+
+OSX users don't need to install Tex-Live because they already have [MacTeX](http://www.tug.org/mactex/) installed.
+
+The build process generates a ZIP package file including the original TeX sources, as well as HTML and PDF formatted versions of the specification.
+
+***To generate the ZIP package, run:***
+```bash
 ./makeall.sh
-</code>
-</dd>
-<dt>Troubleshooting notes:</dt>
-<dd> PDFs of the specification can be generated with
-either MicroSoft's Core fonts for the Web: Arial and Courier New,
-or Liberation fonts: Liberation Sans and Liberation Mono.
-Most systems come with one of these two variants included:
-should you get an error message about missing fonts,
-you will need to downloads and install one of the above
-font packages.
-<dd>
-</dl>
-<h4>Providing Feedback</h4>
-Informal feedback is accepted through the <strong>virtio-comment</strong> mailing list,
-and is archived in <A HREF="https://lore.kernel.org/virtio-comment/">the mailing list archives</A>.
-To provide feedback, subscribe by sending mail to
-<HREF="mailto:virtio-comment+subscribe@lists.linux.dev">virtio-comment+subscribe@lists.linux.dev</A>,
-then after confirming you agree to the IPR sending your feedback to
-<HREF="mailto:virtio-comment@lists.linux.dev">virtio-comment@lists.linux.dev</A>.
-<p>Note that only plain text part of the message is archived, and all
-attachments are stripped. Accordingly, messages sent to the
-mailing list should use text/plain encoding and not
-have any attachments.
-<p>The preferred form of providing feedback is in form of a patch.
-A patch can be generated and sent by cloning the spec repository,
-creating a commit, formatting it as a patch and then sending it.
-For example:
-<code>
-<p>
-git clone https://github.com/oasis-tcs/virtio-spec.git<br>
-... edit spec text, and save ...<br>
-<p>
-git commit -a<br>
-... describe the proposed change, in the following format:<br>
-single line summary<br>
-<br>
-detailed description, including motivation for the change<br>
-<br>
-Signed-off-by: Name &lt;email&gt;<br>
-... then save and close the editor ... <br>
-<p>
-git format-patch -o proposal1/ HEAD~1..<br>
-... generates a new directory proposal1/ and a file starting with 0001- ...<br>
-<p>
+```
+***Troubleshooting notes:***
+  
+PDFs of the specification can be generated with either MicroSoft's Core fonts for the Web: Arial and Courier New, or
+Liberation fonts: Liberation Sans and Liberation Mono. Most systems come with one of these two variants included: should
+you get an error message about missing fonts, you will need to downloads and install one of the above font packages.
+
+#### Providing Feedback
+
+Informal feedback is accepted through the **virtio-comment** mailing list, and is archived in [the mailing list archives](https://lore.kernel.org/virtio-comment/). To provide feedback, subscribe by sending mail to [virtio-comment+subscribe@lists.linux.dev](mailto:virtio-comment+subscribe@lists.linux.dev), then after confirming you agree to the IPR sending your feedback to [virtio-comment@lists.linux.dev](mailto:virtio-comment@lists.linux.dev). Note that only plain text part of the message is archived, and all attachments are stripped. Accordingly, messages sent to the mailing list should use `text/plain` encoding and not have any attachments.
+
+The preferred form of providing feedback is in form of a **patch**. A patch can be generated and sent by cloning the spec repository, creating a commit, formatting it as a patch and then sending it. For example:
+
+```bash
+git clone [https://github.com/oasis-tcs/virtio-spec.git](https://github.com/oasis-tcs/virtio-spec.git)
+# edit spec text, and save ...
+git commit -a
+```
+
+Describe the proposed change, in the following format:
+
+  > single line summary
+  > 
+  > detailed description, including motivation for the change
+  >
+  > Signed-off-by: Name <email>
+
+then save and close the editor
+
+```bash
+git format-patch -o proposal1/ HEAD~1..
+# generates a new directory proposal1/ and a file starting with 0001- ...
 git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
-</code>
-
-<dl>Optionally, you can use <a
-href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
-patch. This project already contains a <em>git-publish</em> profile that will
-configure some fields, e.g., <em>To</em> field with the right address. After you have
-installed <em>git-publish</em>, the procedure is the following:
-
-<code>
-<p>
-git checkout master -b my-feature<br>
-# work on new commits, add your 'Signed-off-by' lines to each<br>
-git publish<br>
-# more work, rebase on master, ...<br>
-git publish # will send a v2<br>
-</code>
-</dl>
-<dl>
-<dt>When to use the virtio-comment mailing list:</dt>
-<dd>
-  questions and change proposals for the Virtio specification,
-  including the specification of basic functionality, transports and
-  devices.
-</dd>
-
-<dt>When <em>not</em> to use the virtio-comment mailing list:</dt>
-<dd>
-  questions and change proposals for Virtio drivers and devices
-  implementing the specification.
-  (please use the <A HREF="mailto:virtio-dev@lists.linux.dev"> virtio-dev mailing list</A> for this).
-</dd>
-
-<dt>To do:</dt>
-<dd>
- send email preferably in text format (best for archiving).
-</dd>
-
-<dt>Not to do:</dt>
-<dd>
-<ul>
-<li> copy both virtio-dev and virtio-comment mailing lists (instead, pick one);
-<li> send full copies of the virtio spec (in any format).
-</ul>
-</dd>
-
-</dl>
-<h4>Note for TC Members</h4>
-<p>TC Members should review TC specific
-process rules under "Further Description of this Repository"
-in <A
-HREF="https://github.com/oasis-tcs/virtio-admin">https://github.com/oasis-tcs/virtio-admin</A>.
-
-</div>
-<h4>Implementation discussion</h4>
-Implementation discussion takes place on the <strong>virtio-dev</strong> mailing list,
-and is archived in <A HREF="https://lore.kernel.org/virtio-dev/">the mailing list archives</A>.
-To participate in the discussion, subscribe by sending mail to
-<HREF="mailto:virtio-dev+subscribe@lists.linux.dev">
-virtio-dev+subscribe@lists.linux.dev</A>.
-After agreeing to the IPR, to participate in the discussion, send
-mail to <HREF="mailto:virtio-dev@lists.linux.dev">virtio-dev@lists.linux.dev</A>.
-<p>This is the correct list to copy on Linux virtio UAPI change proposals.
-<p>Note that only the plain text part of the message is archived, and all
-attachments are stripped. Accordingly, messages sent to the
-mailing list should use text/plain encoding and not
-have any attachments.
-
-<dl>
-<dt>When to use the virtio-dev mailing list:</dt>
-<dd>
-  questions and change proposals for Virtio drivers and devices
-  implementing the specification.
-</dd>
-
-<dt>When <em>not</em> to use the virtio-dev mailing list:</dt>
-<dd>
-  questions and change proposals for the Virtio specification,
-  including the specification of basic functionality, transports and
-  devices (please use the <A HREF="mailto:virtio-comment@lists.linux.dev"> virtio-comment mailing list</A> for this).
-</dd>
-<dt>To do:</dt>
-<dd>
- send email preferably in text format (best for archiving).
-</dd>
-
-<dt>Not to do:</dt>
-<dd>
-copy both virtio-dev and virtio-comment mailing lists (instead, pick one).
-</dd>
-</dl>
-
-<h4>Use of github issues</h4>
-Note: according to the virtio TC rules, all official TC communication
-is taking place on one of the TC mailing lists.
-In particular, all comments must be provided on
-one of the TC mailing lists. Accordingly, the TC will not respond
-to comments provided in github issues: github issues are
-used solely to track integration of comments into the
-specification.<p>
+```
+
+Optionally, you can use [git-publish](https://github.com/stefanha/git-publish) to submit a patch. This project already contains a *git-publish* profile that will configure some fields, e.g., *To* field with the right address. After you have installed *git-publish*, the procedure is the following:
+
+```bash
+git checkout master -b my-feature
+# work on new commits, add your 'Signed-off-by' lines to each
+git publish
+# more work, rebase on master, ...
+git publish # will send a v2
+```
+
+***When to use the virtio-comment mailing list:***
+
+questions and change proposals for the Virtio specification, including the specification of basic functionality, transports and devices.
+
+***When not to use the virtio-comment mailing list:***
+
+questions and change proposals for Virtio drivers and devices implementing the specification. (please use the [virtio-dev mailing list](mailto:virtio-dev@lists.linux.dev) for this).
+
+***To do:***
+- send email preferably in text format (best for archiving).
+
+***Not to do:***
+- copy both virtio-dev and virtio-comment mailing lists (instead, pick one);
+- send full copies of the virtio spec (in any format).
+
+#### Note for TC Members
+
+TC Members should review TC specific process rules under "Further Description of this Repository" in [https://github.com/oasis-tcs/virtio-admin](https://github.com/oasis-tcs/virtio-admin)
+
+#### Implementation discussion
+
+Implementation discussion takes place on the **virtio-dev** mailing list, and is archived in [the mailing list archives](https://lore.kernel.org/virtio-dev/). To participate in the discussion, subscribe by sending mail to
+[virtio-dev+subscribe@lists.linux.dev](mailto:virtio-dev+subscribe@lists.linux.dev). After agreeing to the IPR, to participate in the discussion, send mail to [virtio-dev@lists.linux.dev](mailto:virtio-dev@lists.linux.dev). This is the correct list to copy on Linux virtio UAPI change proposals.
+
+Note that only the plain text part of the message is archived, and all attachments are stripped. Accordingly, messages sent to the mailing list should use text/plain encoding and not have any attachments.
+
+***When to use the virtio-dev mailing list:***
+
+questions and change proposals for Virtio drivers and devices implementing the specification.
+
+***When not to use the virtio-dev mailing list:***
+
+questions and change proposals for the Virtio specification, including the specification of basic functionality, transports and devices (please use the [virtio-comment mailing list](mailto:virtio-comment@lists.linux.dev) for this).
+
+***To do:***
+- send email preferably in text format (best for archiving).
+
+***Not to do:***
+- copy both virtio-dev and virtio-comment mailing lists (instead, pick one).
+
+#### Use of github issues
+
+Note: according to the virtio TC rules, all official TC communication is taking place on one of the TC mailing lists. In particular, all comments must be provided on one of the TC mailing lists. Accordingly, the TC will not respond to comments provided in github issues: github issues are used solely to track integration of comments into the specification.\
 To request a TC vote on resolving a specific comment:
-<ol>
-<li>Create a github issue, or edit an existing issue, with
-a short summary of the comment.
-The issue MUST specify
-the link to the latest proposal in the TC mailing list
-archives. <em>Note:</em> the link MUST be in the issue description itself -
-<em>not</em> in the comments.</li>
-<li>Reply by email to the comment email, requesting that the TC vote
-on resolving the issue.
-The mail requesting the vote should include the following, on a line by itself:<br>
-<code>
-Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
-</code>
-(NNN is the issue number)<br>
-For example, you can use the following template when requesting the TC vote:<br>
-<code>
-Could please open a voting ballot for these changes?<br>
-<br>
-Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN<br>
-</code></li>
-<li>Please make sure to allow time for review between posting a comment
-and asking for a vote. </li>
-</ol>
-<h4>TC standing rules</h4>
-The TC adopted the following standing rule:
-<p>
-<em>
-Minor cleanups, including editorial formatting changes, spelling
-and typo fixes can be committed directly into git for approval as
-part of the next specification approval ballot.
-</em>
-<ol>
-<li>To request such a commit, reply by email to the comment email, requesting that the
-issue is resolved under the minor cleanups standing rule.
-</li>
-<li>Please make sure to allow time for review between posting a comment
-and asking for a commit. </li>
-</ol>
-
-<h3>Contact</h3>
-<p>Please send questions or comments about <a href="https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work">OASIS TC GitHub repositories</a> to <a href="mailto:robin@oasis-open.org">Robin Cover</a> and <a href="mailto:chet.ensign@oasis-open.org">Chet Ensign</a>.  For questions about content in this repository, please contact the TC Chair or Co-Chairs as listed on the the virtio TC's <a href="https://www.oasis-open.org/committees/virtio/">home page</a>.</p>
-</div>
+
+1. Create a github issue, or edit an existing issue, with a short summary of the comment.
+   The issue MUST specify the link to the latest proposal in the TC mailing list
+   archives. *Note:* the link MUST be in the issue description itself - *not* in the comments.
+
+2. Reply by email to the comment email, requesting that the TC vote on resolving the issue.
+   The mail requesting the vote should include the following, on a line by itself:
+
+   ```
+   Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
+   ```
+   (NNN is the issue number)
+
+   For example, you can use the following template when requesting the TC vote:
+
+   ```
+   Could please open a voting ballot for these changes?
+
+   Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
+   ```
+
+3. Please make sure to allow time for review between posting a comment and asking for a vote.
+
+#### TC standing rules
+
+The TC adopted the following standing rule:\
+*Minor cleanups, including editorial formatting changes, spelling and typo fixes can be committed directly into git for approval as part of the next specification approval ballot.*
+
+1. To request such a commit, reply by email to the comment email, requesting that the issue is resolved under the minor cleanups standing rule.
+2. Please make sure to allow time for review between posting a comment and asking for a commit.
+
+### Contact
+
+Please send questions or comments about [OASIS TC GitHub repositories](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work)
+to [Robin Cover](mailto:robin@oasis-open.org) and [Chet Ensign](mailto:chet.ensign@oasis-open.org). For questions about content in this repository, please contact the TC Chair or Co-Chairs
+as listed on the the virtio TC's [home page](https://www.oasis-open.org/committees/virtio/).
-- 
2.47.3

