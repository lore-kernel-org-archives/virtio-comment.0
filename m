Return-Path: <virtio-comment-return-2041-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C8A0986312
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jul 2021 11:10:26 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 22 Jul 2021 12:09:03 +0100
Message-Id: <20210722110903.8769-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-rpmb: fix the description for multi-block reads
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: maxim.uvarov@linaro.org, joakim.bech@linaro.org, ulf.hansson@linaro.org, ilias.apalodimas@linaro.org, arnd@linaro.org, ruchika.gupta@linaro.org, tomas.winkler@intel.com, yang.huang@intel.com, bing.zhu@intel.com, Matti.Moell@opensynergy.com, hmo@opensynergy.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Previously the text said we fail if block count is set to 1 despite
language elsewhere in the text referring to:

  "For RPMB read request, one virtio buffer including request command
  and the subsequent [block_count] virtio buffers for response data
  are placed in the queue."

and the existence of both max_wr_cnt and max_rd_cnt configuration
variables certainly implying devices should be able to handle
multi-block reads just like writes.

Fix the description as well as format the steps as an enumerated list
to match the style of the previous section describing write handling.

Reported-by: Ruchika Gupta <ruchika.gupta@linaro.org>
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 virtio-rpmb.tex | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/virtio-rpmb.tex b/virtio-rpmb.tex
index dfecc3c..1dae3fd 100644
--- a/virtio-rpmb.tex
+++ b/virtio-rpmb.tex
@@ -239,22 +239,24 @@ \subsubsection{Device Operation: Request Queue}\label=
{sec:Device Types / RPMB De
=20
 \devicenormative{\paragraph}{Device Operation: Data Read}{Device Types / R=
PMB Device / Device Operation / Device Operation: Data Read}
=20
-If the authentication key is not yet programmed then VIRTIO_RPMB_RES_NO_AU=
TH_KEY
-SHOULD be returned in \field{result}.
+\begin{enumerate}
+\item If the authentication key is not yet programmed then
+  VIRTIO_RPMB_RES_NO_AUTH_KEY SHOULD be returned in \field{result}.
=20
-If block count has not been set to 1 then VIRTIO_RPMB_RES_GENERAL_FAILURE =
SHOULD be
-responded as \field{result}.
+\item If block count is zero or greater than \field{max_rd_cnt} then
+  VIRTIO_RPMB_RES_GENERAL_FAILURE SHOULD be responded as \field{result}.
=20
-If there is an error in the address (out of range) then the \field{result}=
 SHOULD
-be set to VIRTIO_RPMB_RES_ADDR_FAILURE.
+\item If there is an error in the address (out of range) then the
+  \field{result} SHOULD be set to VIRTIO_RPMB_RES_ADDR_FAILURE.
=20
-If data fetch from addressed location inside the device fails then the \fi=
eld{result}
-SHOULD be VIRTIO_RPMB_RES_READ_FAILURE.
+\item If data fetch from addressed location inside the device fails
+  then the \field{result} SHOULD be VIRTIO_RPMB_RES_READ_FAILURE.
=20
-If some other error occurs during the read procedure then the \field{resul=
t}
-SHOULD be VIRTIO_RPMB_RES_GENERAL_FAILURE.
+\item If some other error occurs during the read procedure then the
+  \field{result} SHOULD be VIRTIO_RPMB_RES_GENERAL_FAILURE.
=20
-The \field{req_resp} value VIRTIO_RPMB_RESP_DATA_READ SHOULD be responded.
+\item The device SHOULD respond with \field{block_count} frames containing=
 the data and \field{req_resp} value set to VIRTIO_RPMB_RESP_DATA_READ.
+\end{enumerate}
=20
 \devicenormative{\paragraph}{Device Operation: Result Read}{Device Types /=
 RPMB Device / Device Operation / Device Operation: Result Read}
=20
--=20
2.20.1


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

