Return-Path: <virtio-comment-return-7845-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B00ECDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:08:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B25052168A
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:08:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95B029868D6
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:08:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 843489868CE; Thu, 19 Oct 2023 09:08:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 716569868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/zqmCT+GJcHX5zHgu+Wenk4og7tfoHql7mKK5V51+DRlVxG5lyd0G6UaH6PX+fLqOgrmv0Ik9zZ4VD+QhTOuYmlAX4nmWUxI48m7fPuEfpzu+yfXISoxd314Frew114E1gvheQ01X0n5bUY3xadX23CdfNrInF1MjAgwWqLlG0X9CSDvTfkHF/bQaBy6GTC4voox6rUJmAJctvhE8XzbStE+9MknsetMwEJSEsQa+oWooCCsuVDZXfWCfytMJPo4r3nDzuptDNGHy7Ytf4zHq5o75HwqfeqUYHuEAs6gcLGvxnRKWtbmbUBqTZCu0v5knSbXuxXbPCmO2vwMP7j1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+irX+iF1dK+BlnBdsrvG/tYdWaG3jmh6VFgftqi7R4=;
 b=eOL+Vq8Z+BeKDUi6baqHFj5zKwjvGwtW9gS4XwYYFbz3XXSX+kZQ6wL9H7vlYa+ghc8mLx5eN47MuAmHIQLn0j69ZW1o2K2rnVdpF70Gck8HT9Dv/wDYyQAfKYb9xkY7LpghsDa4jPHcoT2MgLQLHTnlylCCF6mToDypGHifdx8ztzssJtuvPcox8RMGT8hgCQg6rPQtLnyZkWKA3ce7CXCN+8YeGo5fA2D2Q9rsOBySQy0/w/fe+11i5Gd7ijdWWUC3SKJeoV3RS6esNb1Gv22zMPjHEUHsW4hJEG6yoVfNxv4DIB0qR+PhjOZbWRgWSO1DUwjOLqWdBZdZHIvXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [PATCH v1 2/7] virtio-net: Add flow filter
 capabilities read commands
Thread-Index: AQHZ+N1EYjifVY5LmEKrNq2IBc4sN7BQxcQAgAAgLNA=
Date: Thu, 19 Oct 2023 09:08:55 +0000
Message-ID:
 <PH0PR12MB5481C45B99A2883D998ED0ADDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
 <39cd5f48-2044-4e19-bec0-fa1f0a4c124b@linux.alibaba.com>
In-Reply-To: <39cd5f48-2044-4e19-bec0-fa1f0a4c124b@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW3PR12MB4507:EE_
x-ms-office365-filtering-correlation-id: 11a02865-f231-4043-7d71-08dbd08305d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TjTAVKn8/D2EnqpTq1pHZyFrgTWjvsjbxsjJa9uc5IjW646BxP2nt12hxFUpncp8hCKDEE1yo8xJTb/TroxpxNQsu6ydQi800oZkJ1FoLLLTKmo6cPpYULVmNlu0IlIC4cyJ18UzgpQ0SSXHRwffBRcauNss1BLniKM9JkFMvkEowknds+L4vw/UC1g5LINXqqMS1297fFLeunza6UK3pVpj/WpDvzW6i2Zfw/2p23GPJOgRTuh4l6WjaXzBxUlGec2PcZZuk54+rtxKxbS4y09ZU2/UMYxXFhxAD+gfHIzE+ruHIT0U0YLrLubWItXPINY/cbq1tX58SvOAoO0y4YbULUjERNR65XTohGruAMCPcXWK4XWuYVFBw70urrNfq5GUR9qzdQKhRG13TihU+U5m0wwGLcHhQm9n4p4wt5EfgOwVoJRe4RS/yIHs/wgXy1L0SfYt7WzXg4ae7rZZLMyqT7bG8vy2+lbqCHsW8EZtxnL9hyoTBv/6s1f8Vv/vMMJSKPnIIONTG9jd24c0r3KpWtteir5rvI5o7g5AMQcCxm2sEjZzX6nTfkbjutwCttXlL5psq8+84Jmgh2hHPchmeQlIIHKkMJr66TAprTuqCMmFj3fiOdjt6Ivhfnmg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(66556008)(66446008)(54906003)(76116006)(64756008)(66476007)(478600001)(6916009)(83380400001)(66946007)(71200400001)(38100700002)(33656002)(86362001)(26005)(9686003)(7696005)(55236004)(6506007)(122000001)(38070700005)(316002)(52536014)(8936002)(5660300002)(41300700001)(2906002)(8676002)(4326008)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTFmZkNEKzFtZFBKVEl6cWh1bFBkdjZrL3JCMVZIMUIzL2NCUldTbTBzekdW?=
 =?utf-8?B?M3JBUUVHWm1PTmsvUThzRHNMTmVhWXFjRGhLNDg3ZE0zN0lxNllqN2kzbERG?=
 =?utf-8?B?dndCRk8wREY1NW1VRFhhV1E3UEt2YXMxbktKb1c2Zk4vV3lJL1pEaGRxQXRL?=
 =?utf-8?B?ZjVJS1pIR1pwVlZ6SGZycWgzVEFadUtSN0Z5N1EvVFpIZXBLbDA0eEp3NlBZ?=
 =?utf-8?B?QUlBZG53YXBHanRaaGVUZlRDRy81K0YvUGJhWnJTOWh2M211UlBiV0ErT2Y5?=
 =?utf-8?B?WkVSeisvU2JDR05GUEFvZms0STByaHlSWGZucm14NjYwdXhMQmZmRWF3Q01Y?=
 =?utf-8?B?RDZMRjlJaVFnN2tDQ1BTVUd1SUMvTVQxMTRpVytuNG5mTmw0cWtnQnNDNkNj?=
 =?utf-8?B?MzVJenB2LzFLVm9Nd0xreEUvNVRDUk1mRXFHaUJ1MGRTeGpFV3lJM0M5b1F2?=
 =?utf-8?B?cHg0YklKTWZKNDVUbkQ2U0l6MFpaYmdoN2oxbExOQlJKTWowVVdZOExrOStM?=
 =?utf-8?B?ZTlPMHdQcEhwenpYckFBT1VLcHFjNmNzdVE0KzBBTERnZi9scDhPTldESEYy?=
 =?utf-8?B?eGdCWHdISmcvZ1ppT09BTVdvSzhyL3BsUSsvdkpKUEcxZFZCdTQxeGY0ckRi?=
 =?utf-8?B?SHNteWZKRDhUU0hITlVnWUpldENKQlFpSEZIUnBQcW1RazlpWXVuUFlGc1VG?=
 =?utf-8?B?TmhQdVU4Z1lvT1dwQktRajNZam1IZzJodm55TXlRY0UvTTNYTVFFSHc1amJv?=
 =?utf-8?B?M243T0tzT3lzMG1WY2hQUENuVWxrempmOGpOTkZiSVRTKzl4eUFTN21BdkV5?=
 =?utf-8?B?eVBZSnloeEc0WTlCUDRaSXhDUHAweWQ5OUdJNmtTZzhkR1E5V3dXdGVkN3lq?=
 =?utf-8?B?Z2tROHJ5OElKT2M2UkQ0SHRLTFZsTi83M3VXemtGcWo1ZU5xZ0VvVU9mcEk3?=
 =?utf-8?B?MnBCVVN1UnROZWZQbVdOWEJudllMMzNhTllZcUMwZU9tcDhZR0JIT1ZCWG1V?=
 =?utf-8?B?dDdiTjRFK0s1dDJUTDFMTGFKZ2M4VWlEWkFQMTR5UGQ4TmF1Q2xOV2VpVHZh?=
 =?utf-8?B?Wms1M0U5SWpudmhoMXVtNlFQL0xMTHNmdklFVFRYNnJocDhjVGdkN1JEa09K?=
 =?utf-8?B?bzUyUnNxRzRCaUVkbFlKcEJGakNEb05NTmVmTXE3YWZFVjdSQURKUUU0TUZn?=
 =?utf-8?B?WlRCUTZONE95VW43Z2huaWV4NytrQ2ZJekFQa3JXZnhTMXNxTDJJUHI2OXhz?=
 =?utf-8?B?Q3hxWVR3YmlmdEN4MytsMjZ0TmhtSTNVaHR4TnB1eDZ0SzZuQjhiUUl4WmJ3?=
 =?utf-8?B?V0V4aElyY1pMaFM1ckVmOW9kV0xlL3N2eXUvN0dIN3krTWxzdWZPeGlvc0l0?=
 =?utf-8?B?UnBVeXRQL3lsQ3BkZG1MVG8wYi9HYjJTQkwyd1R3VXZCbXk4M0pmRHZDLzM3?=
 =?utf-8?B?QTl1S0V3dEJGY2k1cEhPL1E3RFZjUk8xbnREQlR2czJvUmh4TDhUcnRjVmRP?=
 =?utf-8?B?T01uT2RoSytjSVVJbUhBSFYxelhvN09lMjJkbldWQ1hYNHdQSU5RN29YTk1U?=
 =?utf-8?B?M3dFRmJ1SWszb3NmdHg4djlBdE1TU0s4d0lBTlFrSmVOSFBXcGE5d1NCaGp4?=
 =?utf-8?B?V3MzaE8vWUdaR0x4T0lpUU5JS1IvdWU0TnBaMVZwd1VtODVpSGhUeGZMT2R3?=
 =?utf-8?B?bHF2UVpzcjAwdWI4VmI1b3BCNlpxTW9Bb0E0N2pWN2YvakFDc3ZZTlMrRk1q?=
 =?utf-8?B?Ymt3ZWJQcGRiWW9yQlI0TWVha1llbWozSnZTM0ZySGV2cDRvSXVTUCsybGFO?=
 =?utf-8?B?enVJREZhbXk2NDcvdmtlN1JETWdWUVFxZEM2RDBZRnp6VGZDNXFwb0MySUZ0?=
 =?utf-8?B?YTY5aG1KMDdoQmlRZkxBcnZkY0pNbmhuVW1zVlFNYmxqYTh4bmFpS21BZmJO?=
 =?utf-8?B?MjlNTGZRbG83Q0FmNlBWdW54WHZpSEJlenp4SzFWMGRFR0RQZlVkcjhhZUJa?=
 =?utf-8?B?R1c2TjczNVIxeXgvTFQyODJUZ2VTaVBkR2xFSUZnLzFuTWY0WnpCU05GckJt?=
 =?utf-8?B?NTFxTWpxYnZOTklzV2dNQm8vRktqTVdJajVoc1lVeUpJMC9NSnVTWUdPejd5?=
 =?utf-8?Q?zuUc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a02865-f231-4043-7d71-08dbd08305d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:08:55.9982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbv1txPy9jM8YhVvLwGhAqulZ717JFrHo3mn1osjFiFlcY4hpyh0NMuHdfAmmh1fumCF3LtxmqaYc0ICmIDsMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4507
Subject: RE: [virtio-comment] [PATCH v1 2/7] virtio-net: Add flow filter
 capabilities read commands

DQo+IEZyb206IEhlbmcgUWkgPGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE9jdG9iZXIgMTksIDIwMjMgMTI6NDMgUE0NCj4gPiArVGhlIFxmaWVsZHttYXhfdnFz
fSBpbmRpY2F0ZXMgdG90YWwgbnVtYmVyIG9mIGZsb3cgZmlsdGVyIHZpcnRxdWV1ZXMNCj4gPiAr
c3VwcG9ydGVkIGJ5IHRoZSBkZXZpY2Ugc3RhcnRpbmcgZnJvbSB2aXJ0cXVldWUgaW5kZXgNCj4g
PiArXGZpZWxke3N0YXJ0X3ZxX2luZGV4fS4gV2hlbiB0aGUgZGV2aWNlIGRvIG5vdCBzdXBwb3J0
IGZsb3cgZmlsdGVyDQo+ID4gK3JlcXVlc3RzIG92ZXIgZmxvdyBmaWx0ZXIgdmlydHF1ZXVlcywN
Cj4gDQo+IHMvZG8gbm90L2RvZXMgbm90DQpGaXhpbmcgaXQuIFRoYW5rcy4NCg==

