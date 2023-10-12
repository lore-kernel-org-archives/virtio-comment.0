Return-Path: <virtio-comment-return-7679-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B3CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BC158F3F49
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3074986836
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A9E86986474; Thu, 12 Oct 2023 10:21:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C86F98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSaFCKLvzYqVy6rcymW7MgdGbFR8Ema0HJ2ipWflv96iPiIZZJ9b8bnqJY1aZ1XOXRi57g8Qq2sc45tPGtLpy2j2b4sJeqR26sTIDp8/QUYstBsEYdPGJ5O0vKl8GmcnLlXr+3z54YbdGgywVNExB5f3OWBK1xd2acjoCqm4BISUDWrOgEGPLV1gKhnXA6Abbiwolh4Wf8hEMMlxu/njGDjylc6qNMlHQEzbjMiP+yjw3fTD2OU9+qOvSkjMSfRn5Panv4uRAjdfaHt2E57lXeAYzcGGudqYoPs5GDIyEca3xSWGnrrnsOqp0sQRGRNr5sa+90qOW+/SW5xodb4Vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6pK4OcORKIpdz/OJWbW+qJuJrACawf8D5StF+oPfKI=;
 b=KjJV3mpoPLa6Bc+J0cUGIcElwEw2JaDcg0cTEnkuFbg8bg2+qd5G8aYRfbke4s+ZqV7XGL5huzp83o3gwdTag+6o6B+RkaWkhA/ySsYvyiG8UAsMpsAhPIlLin5YJqui2bfwSqaXZuIvEtoXXf58KLgxz1PQAVopobXZ4VeZrhYbjsa7Q/vVxoQgXkoVVYmH1aU2GvML9GI3arshNs3EdK1214rB9c8d2waSkHwg2OCZ+NV/HMIn+LNIQl+w+EHC2m1M2FDa04u2i0DV/5jp//+iXYIW+S7Q8U4u1FQT4/IuS53j7xMKS33JnEuv8NWcNKYLtflQ1IhbOLSADplaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAAHNXCAAVl+AIAABSzAgAFhOwCAAAW5UIABFzIAgADsZAA=
Date: Thu, 12 Oct 2023 10:21:39 +0000
Message-ID:
 <PH0PR12MB5481CD209722DC9CA4B96516DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231011155531-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231011155531-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB5938:EE_
x-ms-office365-filtering-correlation-id: 023ef741-9f22-417d-a3c7-08dbcb0d05fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OnQf2Ksvs4FBVNgganE5c4bsf604Xhg2b1zaaflFXcMQQzAQQzzAWlUJdvRCi1Lq+uMTKHdHc9U9JYMvSHEnZCFu419b+VWnVaAXL2/5Hp8mQvEHRyh2FevJLfwuSVGnj80oLIfKpzzAnATGAEchlK5ZZrSUZPdbd3TYc6E5aZelKr+3cmNfg5+J+5gZS3xUHayn8RIvObG0wA3d2T+HR6LFNn9D4mhSmhUKJ4bEyHPWDJpUtQVhTH8cUgxMLI+oCjhDpupmcaff0Cy5HBOhqcAF6hr4Y8iuuPc/qljt1uAF8vmD5PQYb+QCQ4G9z77zHRfAV9zfPSLFKLYLbveUeOB+i+o48lxtEEaUEuygLjjXV3xUmcJCKmKsfI0rgZOueaYBt73opnotltAHL/WzRY1x/bqnsKplo7sNVetXsNYk1oDDndXXo5fdRTO1mUEOEf7drHmh3VBtkrMFMfK+7NaqQO8tcLAHF3T6ntCBZ4CIcEplUjiU58tuntg/EEmL0iQdnJAKa2tCxxxo1D9zRrpFsjH/T62mdhXYrv6xu/PIIiy61U1joSgNYt3jIq/6fCYRyhySDxApG1Q99WS83Z51q6sqvOiQ6LdDjzb7HwVYNyxV023F1U6UoMcScxqE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(55016003)(52536014)(6916009)(316002)(54906003)(64756008)(66476007)(66446008)(76116006)(66946007)(66556008)(8676002)(8936002)(4326008)(38070700005)(122000001)(9686003)(2906002)(4744005)(71200400001)(6506007)(7696005)(83380400001)(33656002)(86362001)(38100700002)(5660300002)(478600001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0IyQWpiZzFrQ3VjYjlISHlWSUIrSlFpWUxrc2x3TTdrKytsZmRhMkxGQWY3?=
 =?utf-8?B?QTBMRXlUN2tYOVBZUHpwUFJ0dXN5Y0t0UnkyUU9rM3VpWkVRZGlrM1VhSUFS?=
 =?utf-8?B?S1BQTk1iR0NUQ2Y5NGxUSXE0VTVHYU9NSWlHUUxoV1F4TmlDb2JvaTlvSFFR?=
 =?utf-8?B?YzhBaHhNdy84VkIxZ0xJZEVkaEhIc3I1eDBBTk8yV2pSZmxlUWhQTGduTjJO?=
 =?utf-8?B?eFlQUmxWSkUyVmlpWWhsQlRGMW5MQXhHRG5sejJYekM5Q1VIdDR6QmZjb3VP?=
 =?utf-8?B?T2dJdlVybEp2UWo2dytFakdsMTF1TkNkNjd6RmpuSTFKTEV1MjBGRUhIaXV4?=
 =?utf-8?B?VnY0eGZzN0dYYWVIeXlXTlVFU1FzUi9jMm55bXlPMG1lWlFVN0ZoenlCZEJt?=
 =?utf-8?B?MU8vUHFwbW1jMldKc0RHSU1aYVVtckxSZlB2emFLeUJNS2ptcmdibmpDSjg5?=
 =?utf-8?B?d1k5Nzd5OFdKMGJCazZTZmI4anNDRmZoZmlYcWNIWUpjWjRPWlMyemlBc1ls?=
 =?utf-8?B?NVU0U3N0UFk4aDN0VHVacXdJN2h0a0VBRVJYa2lUbGxURzgzZFhCM0EySDVl?=
 =?utf-8?B?NHptd3JQK3lzdXA1TzQ0N25maXJqeFdiL2tSSGNjSjM3bElXT2lTaTc0eFl5?=
 =?utf-8?B?WVRzWjJHOGFkS2g3VWJpUDdoZmJQVzlVMUM4OGdlM2lMK1dXbTNDOFpiVVZh?=
 =?utf-8?B?VUowUUFZWTVaendNM0FZamVVK3ZZcHNXK3BEYjg2RnpoRXNETXNjREo1UmJO?=
 =?utf-8?B?SEc0R2FPWksvbm04dkJvc0JvaG9RMHMxUWZHSFJJTW5nVkoxa25lSXRwNmsz?=
 =?utf-8?B?VitjbVBjZTFNRnY5U25vTjFTTDhGT3JOSWZUVTZTelJRbjc1aVdscHZmYjhU?=
 =?utf-8?B?NHJNdjR3bFBoT0pSdkNyUERvNHN4Q0ZYSXNyaEw2SlFhWkpleVEyZWlsV3ZY?=
 =?utf-8?B?aFJCQUkrTThsSm85Wnpob2Q1cU5RRnV5MlgxNlZVSjd5eTNXMU5kdjFPU3Bn?=
 =?utf-8?B?aHRiQmFCOHdzS09jUjZJYzI0cHBoc0ZqSCtzUmxxUVBKK2o1TGk3MXFVdys1?=
 =?utf-8?B?VVlJcWlEWmhmMFBCWXBnRHBFNWd6ZXBXYlhsaDdKS3lkZDdNd1VMUlh6UDBH?=
 =?utf-8?B?ZzJSNlJsLzBMdVVINVZ0OThDd20zWFpaRTZ2TFRsekdrRzlxa0kzWTFqOFM0?=
 =?utf-8?B?MHpHWlpIYVMxVWVlZlJONzFoU0g2UnBDQU1hRWhZZDVxMXJ1RGtZWFkzcyt1?=
 =?utf-8?B?a2ZuUFNvNzZnNU42WjQxWGxrTUkrUjhwU1hGS3lxeUEzeVZMWjhHZGJzUXhT?=
 =?utf-8?B?a2RtRVlwZ0Y4UUtVc1Y5emtvWXhsVDlRVDQvZmZnV0tzV0JzSWpJbjJLZEhh?=
 =?utf-8?B?N1BnSW1iVUNzZWJ1WERHZmt0Y1F4a3E0a1Eyb2ZEWmhyVVhINFprM3JtUTkx?=
 =?utf-8?B?czVrNERReVUyVEp5Z2RrRFJMVnpraVplblE0YjFscWxFYzE5Z0ZNMkRwKzh0?=
 =?utf-8?B?WmNEN0plSyttdklyRWloQmFSQ1BzRnl6VzlvS0t2S2E1M0pNNmVVamV0UW5r?=
 =?utf-8?B?Sld2SHVJT1hmcXF0TXdLTGJPWnBhK3l2ZTZoSWNxWlRjWU1ibGtGYWp4RU80?=
 =?utf-8?B?VWVES3QrQjZSbkdQODRoZXcwcVIyazRxeHhoaDlwNVBHT1I5VWk0NHlUdlRm?=
 =?utf-8?B?SllUNHdzMzBFRFAvN1pVcitYcUVGOXRqR2M0VXVXUGl2MDRlMmFSd2VvaElW?=
 =?utf-8?B?RWRydHIxaWY5WFFRSy9pUXpBZzhZcXBCc2YrbU5CU2VNNEN4Q1RwVitiZjM3?=
 =?utf-8?B?MUdiTjhGTHVCR2hTeXhucXJPa0hEVkQ2SVNUaWl4WGZ2UXljOG90N2R6cTk1?=
 =?utf-8?B?eEt0TDkrTnFSQW51dGtjd1R3WitVcXg5Z0prbEhDUG5CNzh3MkhaSUhoN0Uz?=
 =?utf-8?B?Q2hESFBqSUdMMGErU1gvTlZhNU1qTG1sd05EVEh2QkExT2VyTUxhcVJ5bVpo?=
 =?utf-8?B?V0VzcjJ0enRlNm9tWE9vQUdYTzltS3paeEkzZnV2cm4vZEFXMGdYOWRSeE1j?=
 =?utf-8?B?aUJIR2xWWGc4OERNRkQvWnY0M0J4WWZ3aHVZTVpxRDEyZUpCZkx1ZDQyZkF4?=
 =?utf-8?Q?XydE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023ef741-9f22-417d-a3c7-08dbcb0d05fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 10:21:39.8460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXl2S7gpPNZi+Ca0kAMWf8ZWIYPxjKD/a8TkzPXgSW1bH86+LDlVFoNG4QK+0COFxMfv7MypUbdOqH8AJr1H9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBPY3RvYmVyIDEyLCAyMDIzIDE6NDQgQU0NCj4gDQo+IE9uIFdlZCwgT2N0IDExLCAy
MDIzIGF0IDEwOjQ3OjIzQU0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCg0KPiA+IEZMUiB1
cGRhdGVzIHRoZSBkZXZpY2UgY29udGV4dC4NCj4gPiBEZXZpY2UgaXMgc2VydmluZyB0aGUgZGV2
aWNlIGNvbnRleHQgcmVhZCB3cml0ZSBjb21tYW5kcywgc2VydmluZyBGTFIsDQo+ID4gYW5zd2Vy
aW5nIG1vZGUgY2hhbmdlIGNvbW1hbmQsIFNvIGRldmljZSBrbm93cyB0aGUgYmVzdCBob3cgdG8g
YXZvaWQNCj4gYW55IHJhY2UuDQo+IA0KPiBIZWggd2VsbCBidXQgaWYgZHJpdmVycyBkZXBlbmQg
b24gc3BlY2lmaWMgYmVoYXZpb3VyIHRoZW4gd2UgcmVhbGx5IG5lZWQgdG8NCj4gZG9jdW1lbnQg
dGhhdCBpbiB0aGUgc3BlYy4NCg0KSSBhbSB3b3JraW5nIG9uIHYyIGVucmljaCB0aGUgc3BlYyBs
YW5ndWFnZSBmb3IgbWlzc2luZyBpdGVtcyB0byBhZGRyZXNzIGNvbW1lbnRzIG9mIHlvdXJzIGFu
ZCBKYXNvbi4NCg==

