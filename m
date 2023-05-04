Return-Path: <virtio-comment-return-5780-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD17AC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 17:16:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEB95F90E8
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 17:16:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C76529866BC
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 17:16:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BFC139866B3; Thu,  4 May 2023 17:16:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B04B29866B4
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 17:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Virus-Scanned: E-securemail
Secumail-id: <14c1f.6453e882.54316.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dasVkru7qXgbS+UxcTmIS3zCBD7XOKFX26tn5/rnmzMbFDQOlLBYJmsT10tZnxgk2huEy5H7eIsXzRijdWjcF4UrkHmXbJ1Abkq84Ic11t7ir+4LiQuDtawMMWmyJ3LZIA3YpQbYXRkoi8PnUYZCKSP1PEMgfa5uKy1e2suwecB+5Jf2FA1PGyjnlieBh1VlJRx7bN3Fi3A/8dYnRHF7EKqwINsLlmBBKsjQs8yS2Fabk8vY8L8WeWKtuuxjSBroRjZt0oIlpEMdA2WX7WlUdraULisL3jD9MWcK6zsYC7v0biXq+l1U6pP4vMy5CYVrlV0fRuw6XjclV4mqhOjbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oj7qKhd5liIj7Mt8qpGWZDxTkXjbUsOnZ/yndouDZo=;
 b=lRBeoyvOucve+999nCH2TwI4PbSMBk/q575PLWJ5qryfcT9zQnC9/AjVQs4hnTW9iCmWepvnaMTEph1YcC9lbI8aIvvE5U16bHos+ciMhnYD2b7885XZbSKAQG3ZPmySZJ9jjLbDBKRMxExi8KdkfULih5+bQerp2Jx2IRxkIVLkWke72G6x6dXLFI6C3dRXBZZWLgyO9U6pG0hfh7W2Uddz0eXXWVUuIeMv5Osd8D17BQKtKEW1czNL7p5J7lrDjDaka+Q8y1TtAKFh/DCo6/epNU7CuL179hViwpTDPY1uLfMvo3wuEgn7wI8YP42TYDPek4T/j0GkmHj4SiMzxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
From: Cyril Germond <cgermond@kalrayinc.com>
To: Parav Pandit <parav@nvidia.com>
CC: virtio-comment@lists.oasis-open.org
Thread-Topic: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.
Thread-Index: AQHZUBws9xErIboLTkuPTmBRBa1so69I6OJwgAAwy4CAAZsyAA==
Date: Thu, 4 May 2023 17:16:48 +0000
Message-ID: <PAZP264MB38885621CC322CADCCDC965DC66D9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
References: <20221121090212.645-1-cgermond@kalray.eu>
 <PAZP264MB3888A224F87ABA76501F3CC8C66C9@PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM>
 <d3aa5c40-2b26-9cd1-5e12-83b102fbf610@nvidia.com>
In-Reply-To: <d3aa5c40-2b26-9cd1-5e12-83b102fbf610@nvidia.com>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-gb
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3888:EE_|PR0P264MB2186:EE_
x-ms-office365-filtering-correlation-id: e84b075c-4020-4b27-b8dc-08db4cc35846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GA3jEvfKXdRW/2TnVypb1ZXVIa7deBWDc6F7RAlT9N7Sphpo4OrH5LQT5DieHlgGJQ9pr5/iwP6idtHjcloRkeb+yU8GrB8BTo+5WACtjsFM7kbKRWcyDnXnkI/YhRb5EB2+/kaeA4rStEFQwaHBRCUnY4jKnlvoKRvRnhgq5+VOyMRIjz4mjHj1nudJM0gtRnH8uS6TZxTS/4PwuhuuBGb5OmFzQzT7qnvsCz16YQSUo/wZrf2LzrPYRanEp0FgGShVhSkDVGbslir1a10Cl7l6jjCHDpnX0TiYFCjXENge/xAAqGLFGk+GynMV8NVDReWjCzpJKa0d9niv1wRc1C2uMVrJYSG4k+HNWeAKkg5EqdUQ1pYnbSOL7DipyezVtGro8Brd0Gsp33LYsjSUlIpr6y/rhyqEQ0FAe4XLrTdV+sNzcrV8OgxAOMwnDpJPvYlvRvrlc0ySgHC8hzI+QyUxFnnpDXfes3TqGizi3NbspFZdS/92JDKXtOYgKzXTzoXuXj8pAno0ZML0Fa2Gksw0Kc8Zvw1h40voswcwerMP47qN5PjvoIXrza7fXGWNdjFLFETBesAXL7fB+/rWkgV+bvckj/8LXW4LYT+FRVlj0iWKVyJep+gagb3fF6VS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(396003)(366004)(376002)(451199021)(53546011)(6506007)(26005)(9686003)(186003)(52536014)(83380400001)(71200400001)(7696005)(316002)(55016003)(5660300002)(8936002)(478600001)(2906002)(33656002)(66946007)(6916009)(4326008)(38100700002)(86362001)(122000001)(41300700001)(38070700005)(66476007)(8676002)(64756008)(76116006)(66446008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: VUZSrrVu6+mSKgWuIGEaFEfxHAytojc07ivdxkGejLtY7z+bYmDuX2UN27SKzYts4mOTbkPw+VCzseOZutS+zU2LTbZuZ3yusF78I0jjnMNrWFiHkD9pSwVnyarG58ZxtgQS84K3hyWdb/qY5pC6GHILQybbZEHxJhCjA0bZnF0/HH387K9f/h53Iuo2Lhsh6her/e79dTen08ibxlY1q7bXgkeoUZY8EhDIkeMkKQjkxpuiEWtY0GqYjbzbUrN9o0Zw9cEWO1YDhZOBSWcmu97yfEOz0ocLb3tn/w3J/TvWowwHXTZCn8BaS/NAbvZhj36eTuHlsu5eIhj5hnXLhmns6Nrn7jhs3rs5P/W34XXoK+TCNTd/HNfDKBc6k2EEAJaiOJZrkyHUrE9Vdo/zDy6uUGsrE/YA9p2wVj2wI36gl1uR6D0jXNXHw9vfCAJJnHWWGhC7JtcDmvNZhEkf09jhBIpx2wwvdCys8nL+GFTEvE7dzIQxpbXgEc9PrnMJWBR1zX358xQ22PY49DmEOL9HGD51TdGS7AeMHtDyuIhaiyrpfnTzoncTGGBiGnzTFhvpWkRB5O2WfeLO3XEsX6ur9SWBTmeZPN7BDdM3vqEk36OpnQGElt+1b4mjFVnviC9fhtU/0ce4Yib4tFqn5ytiZd3v5+rgBTRm7GCdttVckrm0//7NL02YkbdbbCu+Yy5BM90NVCU9NDzvz6RaQiTvnaw1/WU+MiaI/76nS95DUaDYzLFEP3k+/bkkSqlrEpj28gUL8u21nB1RdF7eRhokwzl8C05Kf0bOhDtUOnF9/7OV78meFZ3FpZkTpKLCy8tiAqiBOpT1x7rr5JbdiFPn/SNaYJz2fCq36lNnbSQf3vZGPlcOIMpkKx4ps2DDoQyke2Xt6ywgRzzBgUzQFxihtfKdXMo3LkqGQJ3VNCktLtgfeXYd+vp6BalOOkCi
 ByhgMVipxF4+lTnDPdfWozjrXbs0OOeOr+sDX6D9PH5ki8tgJyR70vFO05D2ukG4E1eoag9dBte4xPIxNTisY0lRxCsdtLI4cx6NiSmpLFj2OXkAgeH3nUu9SJgs/pQ/LVjVe6cms8FHX9GfjB6Qye95AYaX5vLvX30HrZgBOYIfELHrAdceyWd+yxJb4mN0UQmZOKYwKKZavZlHYgN/2wNmGFme9nG4+3guUlvO8Ay5u6MNlS2ktom5nYnX4k2z21U8LGAW37FCidZPvtaDnxPwMkDTseGIr3cZLZ+NC5uH5vtJXfrvTrUgLJYUrx7XoRd58oP/9lbclPnORkffvdVkWQ5rA9W9rxvsM9z09l0fVOgPhygZtVI9UZ2rzXqVxTzyJOGxq3Dvz6TSyOdITk22VpxGi94PLG7rxXr9nsyVJwmrCXZqhgoPLplZReKzmIPok/+Hw+WmoI+WsabJWKVpMA6zsfPMJr9ReLXLcUfVYiZ2o5tVCsmZLe4GA4Q2QT5Y1Rp7Xe3fYBXkzCKb8h9mgQPJ07AZEiiu4tNi7kh4l7Knd/90YkBpX0IlcmZN0fdaHQpk/WX2bNerus1uQuLDb532YJLS0NtrcxAtbtBIG7C+AreF0YzTH/gLkDad
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3888.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e84b075c-4020-4b27-b8dc-08db4cc35846
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 17:16:48.6314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDc3Xd2WYHQMpLp8Cqxaq1x3d3SPyMf1A8DkAbXGKUg+WFvj1VJOllwsnea04mgqCEnPktWag7UpZaCQ54ZqxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2186
X-ALTERMIMEV2_out: done
Subject: RE: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr
 struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.

Hello
I agree VIRTIO_NET_HASH_REPORT feature is for incoming packets path.
Nevertheless, it seems - at least to me but I may be wrong there - that the packet header structure data type - as described in chapter 5.1.6 Device Operation - is the same for the Rx and TX packets.
Thus, if VIRTIO_NET_HASH_REPORT feature is negotiated, even for a Rx only feature, , the same virtio_net_hdr structure size should be used for both Rx and TX packets. Am I wrong ?
Thanks,

-----Original Message-----
From: Parav Pandit <parav@nvidia.com> 
Sent: Wednesday, May 3, 2023 6:33 PM
To: Cyril Germond <cgermond@kalrayinc.com>; virtio-comment@lists.oasis-open.org
Subject: Re: [virtio-comment] RE: [PATCH] virtio-net: Fix virtio_net_hdr struct size when VIRTIO_NET_F_HASH_REPORT is negotiated.



On 5/3/2023 9:39 AM, Cyril Germond wrote:
> From: Cyril Germond <cgermond@kalray.eu>
> Sent: Monday, November 21, 2022 10:03 AM
> 
> Hard-coded references to the size of virtio_net_hdr strut are wrong when VIRTIO_NET_HASH_REPORT feature is negotiated.
Please fix spelling,
s/strut/struct

Below changelog should be after "---", so that it doesnt become part of the commit log.
>   
>   \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio 
> Device / Virtqueues / Message Framing}  The framing of messages with 
> descriptors is -independent of the contents of the buffers. For 
> example, a network
> +independent of the contents of the buffers. For example, if 
> +VIRTIO_NET_F_HASH_REPORT has not been negotiated, a network
>   transmit buffer consists of a 12 byte header followed by the network  packet. This could be most simply placed in the descriptor table as a
>   12 byte output descriptor followed by a 1514 byte output descriptor,

Above change does not look correct as the example is for the Tx.
and HASH_REPORT is for the RX.

Once you post the new version as v1 with above fixes, please update the link in the github issue as well.









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

