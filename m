Return-Path: <virtio-comment-return-8809-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2E3C35274
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E642026A34
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2F5A9865F6
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Dec 2023 06:43:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C9BA998647D; Mon, 18 Dec 2023 06:43:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3F9F9867FA
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Dec 2023 06:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1702881799.844000
X-TM-MAIL-UUID: 29685566-ab51-45a9-9174-0b6f312ec74b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j50aCRSRhsot1QjDeUfyc3MDUXYLG54IeJxpFustDrcL8frRUMJCWX6QqD/7ZQkvB0PlgZVJaxbGf+SbLzZY7Yvn3KdB4+m51bRCfNZTFGWAaz7MSdPENq3sy/GvoQv2XmArrjWzUWmUHdK1onhKz3O0hDnGXBywnLTvjFov1NapIYOFzMRHKyxPOaIUHI++KDlD/1a6oy1tpExOykQsXbhqP3Wo8IUVNTmvtlidszkORKx4k/9waU+1ao7186NAjKUBQWUM4SR2D7cFcduXznTd/vfVm+GJOVdDqJEiUffjYrbszYtbkO/cSzCxvZE2cBiej85HFAhUTfRE4XOudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Br0dzNAG8PiD7DBiHBJdgunOnTosSMUkYT/WCsySdE=;
 b=m29CTS2DPydFfwVzxnF+0g9JOUaDNsYtVILqigdxwXYZ0vMKEXU3pVF8pYDhwoxX6HuVbFEr96dgIyioN5/3VEde21eBZF1jIEAi+BHdEGfj9HGwuWY/zJ7SzYF1bkqre0ixie+vD77UltmS2SdBFybHcvYp+6ds6wsU5SAPf+sef12Oqvwl5iPIfQpFvdNp66EEMlMeDwlRINR3VpL0Fznqj79BL+zs8FVOSVb+fgM0Yac5OEmB2SwEye+FNNj58Sr+FnTwGIWfVVe378ZDwKnRP0/9nRNMbjnbRXk+Z2BvC5v4VPq7/Fk0RmtUG/E6CPcMAUVpk91RsxuYrUg1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>
Date: Mon, 18 Dec 2023 07:42:51 +0100
Message-Id: <20231218064253.9734-3-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231218064253.9734-1-peter.hilber@opensynergy.com>
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1EUR05FT047:EE_|BE1P281MB2403:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 065a5779-0fa9-4cf2-745e-08dbff949e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7G1KvVyHNnZxTA242PZgOHm0/P48RxL9LRf17RGSFqz2VdvKu1fbDqOqZ71kuUs31PxDqv9hY7o9IJpyshjGzbOj8nfvQRDg6/y7hXDuo/qKPb1BlA46OmXa7rTuV2aKPcLxYEFF9is3Po2GWxtDGZi6+0d0eckGnEwpaFqIWKt6agX1Mp5c6JnKEx+2GCAB5o8tNKTo61HysWuDt0Nx7QtiXNaqKzqLozclM2xMUeSrN5o6ozHEgJ3B6lquQkjy3uYhbEbKMUok9sb1oDC1H+esfagpyA21zvSjkE6as7SgFVbvNZXl+iXLHpUf5Yko5ADCw14B3YI5a7iWezrzBpL9Amw80ZdE/xW9uo4ighZSXfzhiwfcLQ/yg5jlA+5p1gSvcKR+hLBQR5zKOKcXjeeWdLwtBm+GLasu11N+ZQ1mpVj+weWdABzolHJmT3+kGnYPEacEV9OUtF2GV4ejlPpjqMbDjlWMTUbvUF9PZ51/1yZTzc+gUyXGUynGLcyvNZNHMy4mZHydw91OAhb1nACX2IW4ZyAx7LFYGaVvStdq7C31y6R1i2AgU9+18kmNQctDnDGrC4lOpj673WYoT7IHV6IPBTeS3rVmfdv0bFSUzQd2cb4B/T9HBwtkEl28fDsqTvXl+E+N5KvhYljoNdXrlYSavMvRhQIKepb5QzI7xduaQ3HWxo3eURGDARSY31WBdUmk+udjmT7fObiNdB2lWQRVDvu91CrUqQ+LzoFmgN2fAY1w8HaCodE6RyvjPQXUxKoiG0IltCxe2Yg6Z+NzeGu7bvGzF6Y5cMAI9PQ=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(396003)(39830400003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(36840700001)(40480700001)(1076003)(336012)(26005)(2616005)(36756003)(86362001)(47076005)(83380400001)(44832011)(5660300002)(30864003)(36860700001)(8676002)(4326008)(8936002)(81166007)(70586007)(70206006)(54906003)(6916009)(42186006)(316002)(2906002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:43:17.7517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065a5779-0fa9-4cf2-745e-08dbff949e42
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2403
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28064.005
X-TMASE-Result: 10--11.271800-4.000000
X-TMASE-MatchedRID: YjfDhHOn+oDJ+P2VFrJmrHiXIXWXK9StCMiEBPZ3hhXIRhEhdkLWErIJ
	H52hwBT85vU3PxoHxScBbVrnmZTB9HcOLaNlvVj0JsTg3IIwiivZ/IoKYBoUVqloHyDFpaEs0wd
	Ah5ZfnmqzzKfBEGFrWvb6TbSyvtkovkKgKzhST2/mT3pAttPDxolrr1+rqm9afN5l7ipRk4ji9B
	+elGVsk8z35t3zbaoCDVFge/F9K7b2nBTGjRnxmDnP3JZqsdOanlZ1K7DLqxgkxtQqXREtZOdr4
	zYOOI91NLiWfBhc3pgCD1Ar97m2SMSFE1yXbbEcb9B0a4XF/09WEpmiB2wI275gR7aKDORvKLei
	MOXj8x01435NgRp0O295BU7PSITQXYAHtasLrzSeKdOylUhP2YoCNCa/gL3byBFcP7Tck4T1qGV
	rJw7jclK7runmlPSu/2lFgJzGBPcEZ1mm50iAbkkXVQaP16N5GqpG0zex0TUweIyZbRlQ2yzecB
	j190z12HlzhM3zNtns9WQVYycKfw3lGTiQlxzIv9rSd36EgUIj80Za3RRg8ONxDSe3qv/G0KqSk
	BfjoXFUCOvETJl8Sj5VK4yDqiPbKUNiItbDn4E=
X-TMASE-XGENCLOUD: 9ccdd7fc-cef2-42a9-ba30-a2c8dcade2e5-0-0-200-0
X-TM-Deliver-Signature: 3639C0AB1EFEC968BF991C0210BCF33F
X-TM-Addin-Auth: TjBGjR5AWlYoXbaesCkGnNVhc/Hl6glqK9IvVjfNCm/ZvpdzdYQznO4Tdik
	O334uCZ7Ncn0lUQNwBLoGtyxtRcNMLGrtf0cJW9jriKEIgOatGQM5gjvAOR3n+YwWu6kEGvieEq
	hDCp66t+XGAdQQdtX7lUwW2607BiGa3FTEu9SW9NvPWZ3bw5P3MectC41XD9Q7Oj2EnNzvwk3bW
	c/4GShnoS+Q/5+pFlajjxtl+LDynxkdvS3aYJ52XwImXI6C67/LDlrXKKlU1d6xVj5xqIXYeOyE
	zqSRwQhBzIg0NTc=.utxD2OneDad9anK9W064ZM1c9u10jS6GUBYIlrn2CKNRLiC3bd9fUQpMfy
	KuTpuixu3u1PXT/rEpdcqu6dymNrVdOsaeC2alpQHykjKwUq/om/S4nzZa0NK29c8at8V8hB4tw
	X5O3wabaobXq4Vu1w+yamzZ7Z3t3AGnUYiSdrgn/0/qejE0mxebx3MG6RCY7JagLFfb0YjquJlY
	eNv5IG3FXbAYsrCmAsFxnDRra39brjM7G34KCcT7Ni++SV3nGxKqjwHSiJIrXCH+09iy+8plXum
	CeIQ9onkpABFg0KUdV57T74ZUyUpC4ljLtf9n4XfBwaV9YxUqxq9nYa4FBw==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [RFC PATCH v3 2/4] virtio-rtc: Add initial normative statements

Add the normative statements for the initial device specification.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---
 conformance.tex                         |   2 +
 device-types/rtc/description.tex        | 207 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   9 ++
 device-types/rtc/driver-conformance.tex |   9 ++
 4 files changed, 227 insertions(+)
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 863f9c5825bf..c9a8137f50bf 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -153,6 +153,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -240,6 +241,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index abfa2206894e..7707472f1663 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -98,6 +98,108 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 zero-based, dense indices. All fields named \field{clock_id} contain
 clock identifiers.
 
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+If the \field{struct virtio_rtc_resp_head} field \field{status} is not
+VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
+than \field{status}.
+
+The driver MUST set \emph{reserved} fields in the device-readable part
+of the message to zero.
+
+The driver MUST NOT interpret \emph{reserved} fields in the
+device-writable part of the message.
+
+The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
+device-writable part of the message.
+
+The driver MUST put the request into the device-readable part of the
+message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of a requestq message.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_OK if the device successfully
+executed the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to a status other than VIRTIO_RTC_S_OK if the
+device did not successfully execute the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{msg_type} field which is not described in this
+specification.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{hw_counter} field which is neither described in this
+specification nor otherwise known to the implementation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
+field value supplied with the request does not identify a clock.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
+inconsistent with the specification and if the inconsistence is not
+described by the requirements which stipulate status
+VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
+of the message is too small.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
+part of the message is too small, unless the \field{status} field does
+not fit into the device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
+requirements in this document stipulated another \field{status}.
+
+If the device read-only part of a message M is bigger than the size of
+the request specified for message M, the device MUST ignore the
+additional space.
+
+If the device write-only part of a message M is bigger than the size of
+the response specified for message M, the device MUST ignore the
+additional space.
+
+The device MUST NOT interpret \emph{reserved} fields in the
+device-readable part of the message.
+
+The device MUST set \emph{reserved} fields in the device-writable part
+of the message to zero.
+
+The device MUST set unnamed bits in \emph{flags} fields in the
+device-writable part of the message to zero.
+
+After feature negotiation completion the device MUST NOT change the set
+of clocks until device reset.
+
+The device SHOULD NOT change the set of clocks on a device reset after
+the first device reset.
+
+The device MUST use non-negative integers, which are smaller than the
+number of clocks, as clock identifiers.
+
+For a fixed request value V, the device SHOULD either, for every request
+with value V, always execute successfully, or, for every request with
+value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
+
 \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
 
 Through \emph{control requests}, the driver requests information about
@@ -203,6 +305,42 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 
 \end{description}
 
+\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
+
+\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
+time standard (Coordinated Universal Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the time
+epoch of January 1, 1970, 00:00 UTC.
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
+time standard (International Atomic Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
+epoch of January 1, 1970, 00:00 TAI.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use SI
+seconds subdivisions.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use an
+epoch at a time instant before or during device reset.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set \field{type} to
+one of the clock types defined in this specification, or to a value
+greater than or equal to 0xF000.
+
+For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
+VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
+would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
+\field{hw_counter} and \field{clock_id} values as in M with status
+VIRTIO_RTC_S_OK, and clear the flag otherwise.
+
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
 Through \emph{read requests}, the driver requests clock readings from
@@ -326,3 +464,72 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 through VIRTIO_RTC_REQ_CROSS_CAP.
 
 \end{description}
+
+\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
+
+\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+The device SHOULD continuously support reading of all clocks once
+DRIVER_OK has been set.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY insert UTC
+leap seconds.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY smear UTC
+leap seconds through clock slewing.
+
+For any clock C and read requests \emph{A} and \emph{B} which read C,
+\emph{A} being the message which the driver marks as available before
+\emph{B}, the device MUST obtain the \field{clock_reading} value for the
+message \emph{A} response before the \field{clock_reading} value for the
+message \emph{B} response, or the device MUST obtain the same
+\field{clock_reading} value for both \emph{A} and \emph{B}.
+
+For any clock C, the device MUST mark all read requests reading C as
+used in the total order in which the driver marked these messages as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONO and read requests
+\emph{A} and \emph{B} which read C, \emph{A} being the message which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} value for the message \emph{B} response to a value
+greater than or equal to the \field{clock_reading} value for the message
+\emph{A} response.
+
+The device MUST support VIRTIO_RTC_REQ_READ for every clock.
+
+For VIRTIO_RTC_REQ_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for field
+\field{clock_reading}.
+
+For read requests, the device MUST obtain the \field{clock_reading}
+response value after the read request is marked as available.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
+\field{counter_cycles} to a value which approximates the value which the
+driver would have read from the hardware counter identified by
+\field{hw_counter} at the time instant when the device read the
+\field{clock_reading} value.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status}
+to a value other than \field{VIRTIO_RTC_S_OK} if the device cannot
+determine the approximate value which the driver would have read from
+the hardware counter identified by \field{hw_counter} at the time
+instant when the device read the \field{clock_reading} value.
+
+For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
+\emph{B} which read C and which specify the same hardware counter
+\emph{H} through field \field{hw_counter}, \emph{A} being the message
+which the driver marks as available before \emph{B}, the device MUST set
+the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
+shows after the \field{counter_cycles} value of \emph{A}, or the device
+MUST set the same \field{counter_cycles} value for \emph{A} and
+\emph{B}.
+
+For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
+this specification, the device MUST use the nanosecond as unit for
+field \field{clock_reading}.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 000000000000..4303cd450542
--- /dev/null
+++ b/device-types/rtc/device-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
+
+An RTC device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
new file mode 100644
index 000000000000..689c18d158d0
--- /dev/null
+++ b/device-types/rtc/driver-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
+
+An RTC driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
-- 
2.40.1


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

