Return-Path: <virtio-comment-return-5764-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDAC7EE22
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF05416A411
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3F359866B6
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A546986640; Thu,  4 May 2023 08:21:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 896C69866BA
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188506; x=1685780506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egDOeHkrPPHdTd3+LCQq/x7Ufg2qQhGOv4n5gCPGOfA=;
        b=hKDAspVNdkK4Ab1VjN+KRX6ecitTCaWdaFo82BQo1LrnvVhQQnYv1whnaR/66FfV3X
         57djS6cTnLEvWI2Z3T7B/2lJUH1W+lDJZX+TEvqERcZTxZK9capWAeyBvUdkrZofvTuH
         X1XbWangCoGrlYiM7aB3vRoEg6JFMImrLSivW3EeNcAFLKaBVV4fWlQttv9rtMpVDWeJ
         Hi6JKJVNG8S3Cy2cXYJLq1PQQHFNc18tIZoVXUKosNs97oEnd5PMkcfVIqsIyDhlojUP
         EBqs0hUz9qB2pFJA1BpkSa8YJGHqbreZ1Nb0yMOWu0p1y9egMjdioS3qTr/HlXFXTrpq
         pOKA==
X-Gm-Message-State: AC+VfDwJWpWtqBRYGQMnIqxIUtew/VHqnrLJgnHdX01DqK20NthB2tBe
	F1oPIvXQNxCEqWMDewM/EzX8lQ==
X-Google-Smtp-Source: ACHHUZ5Yi+HeV/HOz0w+wzplMFX4qrvVyFK30v92sNXYkmaoHwHmwk0BmSUFCLlWQSaG76Pz65wxCQ==
X-Received: by 2002:a17:90a:bf8c:b0:24b:8480:39d6 with SMTP id d12-20020a17090abf8c00b0024b848039d6mr1584445pjs.0.1683188505753;
        Thu, 04 May 2023 01:21:45 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: parav@nvidia.com,
	mst@redhat.com,
	stefanha@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	xinhao.kong@duke.edu,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Thu,  4 May 2023 16:19:06 +0800
Message-Id: <20230504081910.238585-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 07/11] transport-fabrics: introduce opcodes

Define opcode with this rule:
The Virtio-oF transport layer commands use 0x0000-0x0fff, and the
device layer commands use 0x1000-0xffff. get/set status/feature/
config use consecutive number.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 134 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 37f57c6..026ff5f 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -704,3 +704,137 @@ \subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio
 Note that Virtio Over Fabrics does not define an interrupt mechanism, generally
 the initiator receives a Completion, it SHOULD generate a host interrupt
 (if no interrupt suspending on device).
+
+\subsubsection{Opcodes Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition}
+This section defines command opcodes for Virtio Over Fabrics:
+
+\begin{lstlisting}
+#define virtio_of_op_connect               0x0000
+#define virtio_of_op_discconnect           0x0001
+#define virtio_of_op_get_feature           0x0002
+#define virtio_of_op_set_feature           0x0003
+#define virtio_of_op_keepalive             0x0004
+#define virtio_of_op_vring                 0x0fff
+#define virtio_of_op_get_vendor_id         0x1000
+#define virtio_of_op_get_device_id         0x1001
+#define virtio_of_op_get_generation        0x1002
+#define virtio_of_op_get_status            0x1004
+#define virtio_of_op_set_status            0x1005
+#define virtio_of_op_get_device_feature    0x1006
+#define virtio_of_op_set_driver_feature    0x1007
+#define virtio_of_op_get_num_queues        0x1008
+#define virtio_of_op_get_queue_size        0x100a
+#define virtio_of_op_get_config            0x100c
+#define virtio_of_op_set_config            0x100d
+\end{lstlisting}
+
+\paragraph{virtio_of_op_connect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
+
+virtio_of_op_connect is used to connect a target for both control queue and virtqueue.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
+and specify the ndesc field as 1, also contains 1 structure virtio_of_vring_desc
+filled by structure virtio_of_command_status.
+
+\paragraph{virtio_of_op_discconnect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_discconnect}
+
+virtio_of_op_discconnect is used to disconnect a target for both control queue and virtqueue.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
+
+\paragraph{virtio_of_op_get_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
+
+virtio_of_op_get_feature is used to get features of target for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
+
+\begin{tabular}{ |l|l|l| }
+\hline
+Feature Select & Value & Description \\
+\hline
+virtio_of_feature_max_segment & 0x0 & Get the maximum segments within a Vring Command supported by target \\
+\hline
+\end{tabular}
+
+\paragraph{virtio_of_op_set_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
+
+virtio_of_op_set_feature is used to set features of initiator for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
+
+\paragraph{virtio_of_op_keepalive}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_keepalive}
+
+virtio_of_op_keepalive is used to keep alive with the target for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
+
+\paragraph{virtio_of_op_vring}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
+
+virtio_of_op_vring is used to transmit buffer for both control queue and virtqueue.
+The initiator MUST issues \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Vring Command}
+and specify the ndesc field as the number of buffer segments,
+also contains ndesc structure virtio_of_vring_desc.
+Each structure virtio_of_vring_desc is filled by each buffer segment one by one.
+
+\paragraph{virtio_of_op_get_vendor_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
+
+virtio_of_op_get_vendor_id is used to get vendor id for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_device_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_id}
+
+virtio_of_op_get_device_id is used to get device id for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_generation}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_generation}
+
+virtio_of_op_get_generation is used to get config generation for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_status}
+
+virtio_of_op_get_status is used to get device status for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_set_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_status}
+
+virtio_of_op_set_status is used to set device status for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and specify the value field of Common Command as le32.
+
+\paragraph{virtio_of_op_get_device_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_feature}
+
+virtio_of_op_get_device_feature is used to get device feature for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
+and reads from value field of Completion as le64.
+
+\paragraph{virtio_of_op_set_driver_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_driver_feature}
+
+virtio_of_op_set_driver_feature is used to set driver feature for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
+and specify the value field of Common Command as le64.
+
+The initiator uses feature_select field to select which feature bits to set.
+Value 0x0 selects Feature Bits 0 to 63, 0x1 selects Feature Bits 64 to 128, etc.
+
+\paragraph{virtio_of_op_get_num_queues}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues}
+
+virtio_of_op_get_num_queues is used to get the number of queues for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le16.
+
+\paragraph{virtio_of_op_get_queue_size}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_queue_size}
+
+virtio_of_op_get_queue_size is used to get the size of a specified queue for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Command} with specified queue_id,
+and reads from value field of Completion as le16.
+
+\paragraph{virtio_of_op_get_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_config}
+
+virtio_of_op_get_config is used to get the config of a device for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes,
+and reads from value field of Completion.
+
+\paragraph{virtio_of_op_set_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_config}
+
+virtio_of_op_set_config is used to set the config of a device for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes and value fields.
-- 
2.25.1


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

